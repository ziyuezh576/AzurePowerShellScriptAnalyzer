# Import-Module AzPreview
# Import-Module AzureRM

enum RuleNames {
    Unknown_Parameter_Set
    Invalid_Parameter_Name
    Duplicate_Parameter_Name
    Unassigned_Parameter
    Unassigned_Variable
    Unbinded_Expression
    Mismatched_Parameter_Value_Type
}

function Get-ParameterNameNotAlias {
    param (
        [System.Management.Automation.CommandInfo]$GetCommand,
        [string]$ParameterName
    )

    return ($GetCommand.Parameters.Values | where {
        $ParameterName -in @($_.Name) + @($_.Aliases)
    }).Name
}

function Get-FinalVariableValue {
    param ([System.Management.Automation.Language.Ast]$CommandElementAst)

    while ($true) {
        if ($CommandElementAst.Expression -ne $null) {
            $CommandElementAst = $CommandElementAst.Expression
        }
        elseif ($CommandElementAst.Target -ne $null) {
            $CommandElementAst = $CommandElementAst.Target
        }
        elseif ($CommandElementAst.Pipeline -ne $null) {
            $CommandElementAst = $CommandElementAst.Pipeline
        }
        elseif ($CommandElementAst.PipelineElements -ne $null) {
            $CommandElementAst = $CommandElementAst.PipelineElements[-1]
        }
        else {
            break
        }
    }
    return $CommandElementAst
}

function Measure-ParameterNameValuePair {
    param (
        [System.Management.Automation.CommandInfo]$GetCommand,
        [string]$ParameterName,
        [System.Management.Automation.Language.Ast]$CommandElementAst
    )

    $ParameterNameNotAlias = Get-ParameterNameNotAlias $GetCommand $ParameterName
    $CommandElementAst_Copy = Get-FinalVariableValue $CommandElementAst

    while ($CommandElementAst_Copy -is [System.Management.Automation.Language.VariableExpressionAst]) {
        # get the actual value
        $CommandElementAst_Copy = Get-FinalVariableValue $global:AssignmentLeft_Right_Pair.("$" + ([System.Management.Automation.Language.VariableExpressionAst]$CommandElementAst_Copy).VariablePath)
        if ($CommandElementAst_Copy -eq $null) {
            # Variable is not assigned with a value.
            return @{
                CommandName = $CommandName
                ParameterName = "-$ParameterName"
                ExpressionToParameter = $CommandElementAst.Extent.Text + " is a null-valued parameter value."
            }
        }
    }
    if ($CommandElementAst_Copy -is [System.Management.Automation.Language.CommandAst]) {
        # value is a command
        $GetElementCommand = Get-Command $CommandElementAst_Copy.CommandElements[0].Extent.Text -ErrorAction SilentlyContinue
        if ($GetElementCommand -eq $null) {
            # CommandName is not valid.
            # will be reported in next CommandAst
            return $null
        }
        $ReturnType = $GetElementCommand.OutputType[0].Type
        $ExpectedType = $GetCommand.Parameters.$ParameterNameNotAlias.ParameterType
        if ($ReturnType -eq $null)
        {
            return @{
                CommandName = $CommandName
                ParameterName = "-$ParameterName"
                ExpressionToParameter = $CommandElementAst.Extent.Text
            }
        }

        if ($ReturnType.IsArray) {
            $ReturnType = $ReturnType.GetElementType()
        }
        if ($ExpectedType.IsArray) {
            $ExpectedType = $ExpectedType.GetElementType()
        }
        if ($ReturnType -ne $ExpectedType -and $ReturnType -isnot $ExpectedType) {
            if (!$ExpectedType.IsInterfaces) {
                return @{
                    CommandName = $CommandName
                    ParameterName = "-$ParameterName"
                    ExpressionToParameter = $CommandElementAst.Extent.Text
                }
            }
            elseif ($ExpectedType -notin $ReturnType.GetInterfaces()) {
                return @{
                    CommandName = $CommandName
                    ParameterName = "-$ParameterName"
                    ExpressionToParameter = $CommandElementAst.Extent.Text
                }
            }
        }
    }
    else {
        # value is a constant expression
        $ExpectedType = $GetCommand.Parameters.$ParameterNameNotAlias.ParameterType
        $ConvertedObject = $CommandElementAst_Copy.Value -as $ExpectedType
        if ($CommandElementAst_Copy.StaticType -ne $ExpectedType -and $ConvertedObject -eq $null) {
            return @{
                CommandName = $CommandName
                ParameterName = "-$ParameterName"
                ExpressionToParameter = $CommandElementAst.Extent.Text
            }
        }
    }
}

<#
.DESCRIPTION
Detect parameter and expression error
#>
function Measure-ParameterNameAndValue {
    [CmdletBinding()]
    [OutputType([Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord[]])]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.Language.ScriptBlockAst]
        $ScriptBlockAst
    )

    process {
        $Results = @()
        $global:CommandName_Parameter_Expression_Pair = @()
        $global:Ast = $null
        $global:AssignmentLeft_Right_Pair = @{}
        $global:ParameterSet = $null
        $global:Command_AppearedParameters_Pair = @{}
        $global:Command_AppearedExpressions_Pair = @{}
        $global:Command_ParameterAndExpression_Pair = @{}
        $global:SkipNextCommandElementAst = $false

        try {
            [ScriptBlock]$Predicate = {
                param ([System.Management.Automation.Language.Ast]$Ast)
                $global:Ast = $Ast

                if ($Ast -is [System.Management.Automation.Language.AssignmentStatementAst]) {
                    [System.Management.Automation.Language.AssignmentStatementAst]$AssignmentStatementAst = $Ast
                    $global:AssignmentLeft_Right_Pair.($AssignmentStatementAst.Left.Extent.Text) = $AssignmentStatementAst.Right
                }

                if ($Ast -is [System.Management.Automation.Language.CommandElementAst] -and $Ast.Parent -is [System.Management.Automation.Language.CommandAst]) {
                    [System.Management.Automation.Language.CommandElementAst]$CommandElementAst = $Ast
                    [System.Management.Automation.Language.CommandAst]$CommandAst = $CommandElementAst.Parent

                    if ($global:SkipNextCommandElementAst) {
                        $global:SkipNextCommandElementAst = $false
                        return $false
                    }

                    $CommandText = $CommandAst.Extent.Text
                    # $CommandName = $CommandAst.GetCommandName()
                    $CommandName = $CommandAst.CommandElements[0].Extent.Text
                    $GetCommand = Get-Command $CommandName -ErrorAction Ignore
                    if ($GetCommand -eq $null) {
                        return $false
                    }
                    if ($GetCommand.CommandType -eq "Alias") {
                        # $CommandNameNotAlias = $GetCommand.ResolvedCommandName
                        $CommandNameNotAlias = (Get-Alias $CommandName)[0].ResolvedCommandName
                        $GetCommand = Get-Command $CommandNameNotAlias
                    }

                    if ($CommandElementAst -is [System.Management.Automation.Language.ConstantExpressionAst] -and
                    $CommandAst.CommandElements.Extent.Text.IndexOf($CommandElementAst.Extent.Text) -eq 0) {
                        # This CommandElement is cmdlet.
                        # reset or add
                        $global:Command_AppearedParameters_Pair.$CommandText = @()
                        $global:Command_AppearedExpressions_Pair.$CommandText = @()
                        $global:Command_ParameterAndExpression_Pair.$CommandText = @()

                        # Move ParameterSets that have more position parameters to the front.
                        $ParameterSets = @() + ($GetCommand.ParameterSets | Sort-Object {($_.Parameters.Position | where {$_ -ge 0}).Count} -Descending)
                        foreach ($ParameterSet in $ParameterSets) {
                            $AllParameterNamesInSet_Flag = $true
                            $ParametersInSet = $ParameterSet.Parameters.Name + $ParameterSet.Parameters.Aliases
                            $AllParameters = $GetCommand.Parameters.Values.Name + $GetCommand.Parameters.Values.Aliases
                            foreach ($CommandElement in $CommandAst.CommandElements) {
                                if ($CommandElement -is [System.Management.Automation.Language.CommandParameterAst]) {
                                    $ParameterName = ([System.Management.Automation.Language.CommandParameterAst]$CommandElement).ParameterName
                                    if ($ParameterName -notin $ParametersInSet -and $ParameterName -in $AllParameters) {
                                        # Skip ParameterNames that are not in AllParameters. They will be reported later.
                                        $AllParameterNamesInSet_Flag = $false
                                        break
                                    }
                                }
                                if ($CommandElement -is [System.Management.Automation.Language.VariableExpressionAst] -and
                                ([System.Management.Automation.Language.VariableExpressionAst]$CommandElement).Splatted -eq $true) {
                                    $ParameterNames = $global:AssignmentLeftAndRight.$("$" + ([System.Management.Automation.Language.VariableExpressionAst]$CommandElement).VariablePath).Expression.KeyValuePairs.Item1.Value
                                    foreach ($ParameterName in $ParameterNames) {
                                        if ($ParameterName -notin $ParametersInSet -and $ParameterName -in $AllParameters) {
                                            # Skip ParameterNames that are not in AllParameters. They will be reported later.
                                            $AllParameterNamesInSet_Flag = $false
                                            break
                                        }
                                    }
                                }
                            }
                            if ($AllParameterNamesInSet_Flag) {
                                break
                            }
                        }

                        if ($AllParameterNamesInSet_Flag -eq $false) {
                            # Not all parameters in a same ParameterSet.
                            $global:ParameterSet = $null
                            $global:CommandName_Parameter_Expression_Pair += @{
                                CommandName = $CommandText
                                ParameterName = ""
                                ExpressionToParameter = ""
                            }
                            return $true
                        }
                        else {
                            # Create Parameter_Expression_Pair
                            $global:ParameterSet = $ParameterSet
                            $Parameter_Expression_Pair = @()
                            for ($i = 1; $i -lt $CommandAst.CommandElements.Count; $i++) {
                                $CommandElement = $CommandAst.CommandElements[$i]
                                $NextCommandElement = $CommandAst.CommandElements[$i + 1]
                                if ($CommandElement -is [System.Management.Automation.Language.CommandParameterAst]) {
                                    $CommandParameterElement = [System.Management.Automation.Language.CommandParameterAst]$CommandElement
                                    $ParameterName = $CommandParameterElement.ParameterName
                                    $ParameterNameNotAlias = Get-ParameterNameNotAlias $GetCommand $ParameterName
                                    if ($ParameterNameNotAlias -eq $null) {
                                        # Non-existant parameter name.
                                        # will report later.
                                        $Parameter_Expression_Pair += @{
                                            ParameterName = $ParameterName
                                            ExpressionToParameter = "<NonExistantParameterName>"
                                        }
                                        if ($NextCommandElement -ne $null -and $NextCommandElement -isnot [System.Management.Automation.Language.CommandParameterAst]) {
                                            $i += 1
                                        }
                                        continue
                                    }
                                    if ($GetCommand.Parameters.$ParameterNameNotAlias.SwitchParameter -eq $true) {
                                        # SwitchParameter
                                        $Parameter_Expression_Pair += @{
                                            ParameterName = $ParameterNameNotAlias
                                            ExpressionToParameter = "<SwitchParameter>"
                                        }
                                    }
                                    else {
                                        # not a SwitchParameter
                                        if ($NextCommandElement -eq $null -or $NextCommandElement -is [System.Management.Automation.Language.CommandParameterAst]) {
                                            # NonSwitchParameter + Parameter
                                            # Parameter must be assigned with a value.
                                            # will report later.
                                            $Parameter_Expression_Pair += @{
                                                ParameterName = $ParameterNameNotAlias
                                                ExpressionToParameter = "<NoValue>"
                                            }
                                        }
                                        else {
                                            # NonSwitchParameter + Expression
                                            $Parameter_Expression_Pair += @{
                                                ParameterName = $ParameterNameNotAlias
                                                ExpressionToParameter = $NextCommandElement
                                            }
                                            $i += 1
                                        }
                                    }
                                }
                                elseif ($CommandElement -is [System.Management.Automation.Language.VariableExpressionAst] -and
                                ([System.Management.Automation.Language.VariableExpressionAst]$CommandElement).Splatted -eq $true) {
                                    # @var
                                    $KeyValuePairs = $global:AssignmentLeftAndRight.$("$" + ([System.Management.Automation.Language.VariableExpressionAst]$CommandElement).VariablePath).Expression.KeyValuePairs
                                    $ParameterNames = $KeyValuePairs.Item1.Value
                                    foreach ($ParameterName in $ParameterNames) {
                                        $ParameterNameNotAlias = Get-ParameterNameNotAlias $GetCommand $ParameterName
                                        if ($ParameterNameNotAlias -eq $null) {
                                            # Non-existant parameter name.
                                            # will report later.
                                            $Parameter_Expression_Pair += @{
                                                ParameterName = $ParameterName
                                                ExpressionToParameter = "<NonExistantParameterName>"
                                            }
                                        }
                                        else {
                                            $Parameter_Expression_Pair += @{
                                                ParameterName = $ParameterNameNotAlias
                                                ExpressionToParameter = ($KeyValuePairs | where {$_.Item1.Value -eq $ParameterName}).Item2
                                            }
                                        }
                                    }
                                }
                                elseif ($CommandElement -is [System.Management.Automation.Language.ExpressionAst]) {
                                    # Expression
                                    $CommandExpressionElement = [System.Management.Automation.Language.ExpressionAst]$CommandElement
                                    $PositionMaximum = ($global:ParameterSet.Parameters.Position | Measure-Object -Maximum).Maximum
                                    for ($Position = 0; $Position -le $PositionMaximum; $Position++) {
                                        $PositionParameterName = @() + ($global:ParameterSet.Parameters | where {$_.Position -eq $Position}).Name
                                        if ($PositionParameterName -ne $null -and $PositionParameterName -notin $Parameter_Expression_Pair.ParameterName) {
                                            $Parameter_Expression_Pair += @{
                                                ParameterName = $PositionParameterName[0]
                                                ExpressionToParameter = $CommandExpressionElement
                                            }
                                            break
                                        }
                                    }
                                    if ($Position -gt $PositionMaximum) {
                                        # This expression doesn't belong to any parameters.
                                        $Parameter_Expression_Pair += @{
                                            ParameterName = "<unknown>"
                                            ExpressionToParameter = $CommandExpressionElement
                                        }
                                    }
                                }
                            }
                            $global:Command_ParameterAndExpression_Pair.$CommandText += $Parameter_Expression_Pair
                        }
                    }

                    if ($global:ParameterSet -eq $null) {
                        # skip commands that can't determine their ParameterSets.
                        return $false
                    }

                    if ($CommandElementAst -is [System.Management.Automation.Language.CommandParameterAst]) {
                        # This CommandElement is CommandParameter.
                        $index = $CommandAst.CommandElements.Extent.Text.IndexOf($CommandElementAst.Extent.Text)
                        $NextCommandElement = $CommandAst.CommandElements[$index + 1]
                        $ParameterName = ([System.Management.Automation.Language.CommandParameterAst]$CommandElementAst).ParameterName
                        $ParameterNameNotAlias = Get-ParameterNameNotAlias $GetCommand $ParameterName
                        if ($ParameterNameNotAlias -eq $null) {
                            # Non-existant parameter name.
                            if ($NextCommandElement -is [System.Management.Automation.Language.ExpressionAst]) {
                                $global:SkipNextCommandElementAst = $true
                                $global:Command_AppearedExpressions_Pair.$CommandText += $NextCommandElement.Extent.Text
                            }
                            $global:CommandName_Parameter_Expression_Pair += @{
                                CommandName = $CommandName
                                ParameterName = $ParameterName
                                ExpressionToParameter = ""
                            }
                            return $true
                        }

                        # ParameterName is correct.
                        if ($ParameterNameNotAlias -in $global:Command_AppearedParameters_Pair.$CommandText) {
                            # This parameter appeared more than once.
                            if ($NextCommandElement -is [System.Management.Automation.Language.ExpressionAst]) {
                                $global:SkipNextCommandElementAst = $true
                                $global:Command_AppearedExpressions_Pair.$CommandText += $NextCommandElement.Extent.Text
                            }
                            $global:CommandName_Parameter_Expression_Pair += @{
                                CommandName = $CommandName
                                ParameterName = $ParameterNameNotAlias
                                ExpressionToParameter = "<duplicate>"
                            }
                            return $true
                        }

                        $global:Command_AppearedParameters_Pair.$CommandText += $ParameterNameNotAlias
                        if ($GetCommand.Parameters.$ParameterNameNotAlias.SwitchParameter -eq $false) {
                            # Parameter is not a SwitchParameter.
                            if ($NextCommandElement -eq $null -or $NextCommandElement -is [System.Management.Automation.Language.CommandParameterAst]) {
                                # Parameter is not assigned with a value.
                                $global:CommandName_Parameter_Expression_Pair += @{
                                    CommandName = $CommandName
                                    ParameterName = $ParameterName
                                    ExpressionToParameter = $null
                                }
                                return $true
                            }
                            else {
                                # Parameter is assigned with a value.
                                $global:SkipNextCommandElementAst = $true
                                $global:Command_AppearedExpressions_Pair.$CommandText += $NextCommandElement.Extent.Text
                                $Return = Measure-ParameterNameValuePair $GetCommand $ParameterName $NextCommandElement
                                if ($Return -ne $null) {
                                    # Mismatched_Parameter_Value_Type
                                    $global:CommandName_Parameter_Expression_Pair += @{
                                        CommandName = $CommandName
                                        ParameterName = "-$ParameterName"
                                        ExpressionToParameter = $Return.ExpressionToParameter
                                    }
                                    return $true
                                }
                            }
                        }
                    }

                    if ($CommandElementAst -is [System.Management.Automation.Language.ExpressionAst] -and
                    $CommandAst.CommandElements.Extent.Text.IndexOf($CommandElementAst.Extent.Text) -ne 0) {
                        $global:Command_AppearedExpressions_Pair.$CommandText += $CommandElementAst.Extent.Text
                        if ($CommandElementAst -is [System.Management.Automation.Language.VariableExpressionAst] -and
                        ([System.Management.Automation.Language.VariableExpressionAst]$CommandElementAst).Splatted -eq $true) {
                            # @var
                            $KeyValuePairs = $global:AssignmentLeftAndRight.$("$" + ([System.Management.Automation.Language.VariableExpressionAst]$CommandElementAst).VariablePath)
                            $ParameterNames = $KeyValuePairs.Item1.Value
                            foreach ($ParameterName in $ParameterNames) {
                                $ParameterNameNotAlias = Get-ParameterNameNotAlias $GetCommand $ParameterName
                                $Expression = ($KeyValuePairs | where {$_.Item1.Value -eq $ParameterName}).Item2
                                if ($ParameterNameNotAlias -eq $null) {
                                    # Non-existant parameter name.
                                    $global:CommandName_Parameter_Expression_Pair += @{
                                        CommandName = $CommandName
                                        ParameterName = ""
                                        ExpressionToParameter = $CommandElementAst.Extent.Text
                                    }
                                    return $true
                                }
                                else {
                                    $Return = Measure-ParameterNameValuePair $GetCommand $ParameterName $Expression
                                    if ($Return -ne $null) {
                                        # Mismatched_Parameter_Value_Type
                                        $global:CommandName_Parameter_Expression_Pair += @{
                                            CommandName = $CommandName
                                            ParameterName = ""
                                            ExpressionToParameter = $CommandElementAst.Extent.Text
                                        }
                                        return $true
                                    }
                                }
                            }
                        }
                        else {
                            # This CommandElement is an expression assigned to a position parameter.
                            # When there are duplicate parameter values:
                            $index = ($global:Command_AppearedExpressions_Pair.$CommandText | where {$_ -eq $CommandElementAst.Extent.Text}).Count - 1
                            $PairsWithThisExpression = @() + ($global:Command_ParameterAndExpression_Pair.$CommandText | where {$_.ExpressionToParameter.Extent.Text -eq $CommandElementAst.Extent.Text})
                            $PositionParameterName = $PairsWithThisExpression[$index].ParameterName
                            if ($PositionParameterName -eq "<unknown>") {
                                # Unbinded_Expression
                                $global:CommandName_Parameter_Expression_Pair += @{
                                    CommandName = $CommandName
                                    ParameterName = $PositionParameterName
                                    ExpressionToParameter = $CommandElementAst.Extent.Text
                                }
                                return $true
                            }

                            $Return = Measure-ParameterNameValuePair $GetCommand $PositionParameterName $CommandElementAst
                            if ($Return -ne $null) {
                                # Mismatched_Parameter_Value_Type
                                $global:CommandName_Parameter_Expression_Pair += @{
                                    CommandName = $CommandName
                                    ParameterName = "[-$PositionParameterName]"
                                    ExpressionToParameter = $Return.ExpressionToParameter
                                }
                                return $true
                            }
                        }
                    }
                }

                return $false
            }

            [System.Management.Automation.Language.Ast[]]$Asts = $ScriptBlockAst.FindAll($Predicate, $false)
            for ($i = 0; $i -lt $Asts.Count; $i++) {
                if ($global:CommandName_Parameter_Expression_Pair[$i].ParameterName -eq "" -and $global:CommandName_Parameter_Expression_Pair[$i].ExpressionToParameter -eq "") {
                    $Message = "`"$($global:CommandName_Parameter_Expression_Pair[$i].CommandName)`" has a parameter not in the same ParameterSet as others."
                    $RuleName = [RuleNames]::Unknown_Parameter_Set
                    $Severity = "Error"
                }
                elseif ($global:CommandName_Parameter_Expression_Pair[$i].ExpressionToParameter -eq "") {
                    $Message = "`"$($global:CommandName_Parameter_Expression_Pair[$i].CommandName) -$($global:CommandName_Parameter_Expression_Pair[$i].ParameterName)`" is not a valid parameter name."
                    $RuleName = [RuleNames]::Invalid_Parameter_Name
                    $Severity = "Error"
                }
                elseif ($global:CommandName_Parameter_Expression_Pair[$i].ExpressionToParameter -eq "<duplicate>") {
                    $Message = "`"$($global:CommandName_Parameter_Expression_Pair[$i].CommandName) -$($global:CommandName_Parameter_Expression_Pair[$i].ParameterName)`" appeared more than once."
                    $RuleName = [RuleNames]::Duplicate_Parameter_Name
                    $Severity = "Error"
                }
                elseif ($global:CommandName_Parameter_Expression_Pair[$i].ExpressionToParameter -eq $null) {
                    $Message = "`"$($global:CommandName_Parameter_Expression_Pair[$i].CommandName) -$($global:CommandName_Parameter_Expression_Pair[$i].ParameterName)`" must be assigned with a value."
                    $RuleName = [RuleNames]::Unassigned_Parameter
                    $Severity = "Error"
                }
                elseif ($global:CommandName_Parameter_Expression_Pair[$i].ExpressionToParameter.EndsWith(" is a null-valued parameter value.")) {
                    $ExpressionToParameterLength = $global:CommandName_Parameter_Expression_Pair[$i].ExpressionToParameter.Length - " is a null-valued parameter value.".Length
                    $Message = "`"$($global:CommandName_Parameter_Expression_Pair[$i].CommandName) $($global:CommandName_Parameter_Expression_Pair[$i].ParameterName) $($global:CommandName_Parameter_Expression_Pair[$i].ExpressionToParameter.Substring(0, $ExpressionToParameterLength))`" is a null-valued parameter value."
                    $RuleName = [RuleNames]::Unassigned_Variable
                    $Severity = "Warning"
                }
                elseif ($global:CommandName_Parameter_Expression_Pair[$i].ParameterName -eq "<unknown>") {
                    $Message = "`"$($global:CommandName_Parameter_Expression_Pair[$i].CommandName) $($global:CommandName_Parameter_Expression_Pair[$i].ExpressionToParameter)`" is not explicitly assigned to a parameter."
                    $RuleName = [RuleNames]::Unbinded_Expression
                    $Severity = "Warning"
                }
                else {
                    $Message = "`"$($global:CommandName_Parameter_Expression_Pair[$i].CommandName) $($global:CommandName_Parameter_Expression_Pair[$i].ParameterName) $($global:CommandName_Parameter_Expression_Pair[$i].ExpressionToParameter)`" is not an expected parameter value type."
                    $RuleName = [RuleNames]::Mismatched_Parameter_Value_Type
                    $Severity = "Warning"
                }
                $Result = [Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord]@{
                    Message = $Message;
                    Extent = $Asts[$i].Extent;
                    RuleName = $RuleName;
                    Severity = $Severity
                }
                $Results += $Result
            }
            return $Results
        }
        catch {
            $Result = [Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord]@{
                Message = $_.Exception.Message;
                Extent = $global:Ast.Extent;
                RuleName = $PSCmdlet.MyInvocation.InvocationName;
                Severity = "Error"
            }
            $Results += $Result
            return $Results
        }
    }
}

Export-ModuleMember -Function Measure-*
