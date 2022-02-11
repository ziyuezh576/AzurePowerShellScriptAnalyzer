# Import-Module Az
# Import-Module AzureRM
function Measure-AliasAndWrongCommandName {
    [CmdletBinding()]
    [OutputType([Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord[]])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.Language.ScriptBlockAst]
        $ScriptBlockAst
    )

    begin {}

    process {
        $Results = @()
        $global:CommandParameterPair = @()
        $global:Ast = $null

        try {
            [ScriptBlock]$Predicate = {
                param([System.Management.Automation.Language.Ast]$Ast)
                $global:Ast = $Ast
                if ($Ast -is [System.Management.Automation.Language.CommandAst]) {
                    [System.Management.Automation.Language.CommandAst]$CommandAst = $Ast
                    $CommandName = $CommandAst.GetCommandName()
                    $GetCommand = Get-Command $CommandName -ErrorAction SilentlyContinue
                    if (-not $?) {
                        # Command is not valid.
                        $global:CommandParameterPair += @{
                            CommandName = $CommandName
                            ParameterName = "is not valid"
                        }
                        return $true
                    }
                    else {
                        if ($GetCommand.CommandType -eq "Alias") {
                            # Command is an alias.
                            $global:CommandParameterPair += @{
                                CommandName = $CommandName
                                ParameterName = "is an alias"
                            }
                            return $true
                        }
                        if ($CommandName -cnotmatch "^([A-Z][a-z]*)+-([A-Z][a-z]*)+$") {
                            # CommandName doesn't follow the Capitalization Conventions.
                            $global:CommandParameterPair += @{
                                CommandName = $CommandName
                                ParameterName = "doesn't follow the Capitalization Conventions"
                            }
                            return $true
                        }
                    }
                }
                return $false
            }

            [System.Management.Automation.Language.Ast[]]$Asts = $ScriptBlockAst.FindAll($Predicate, $false)
            for ($i = 0; $i -lt $Asts.Count; $i++) {
                if ($global:CommandParameterPair[$i].ParameterName -eq "is not valid") {
                    $Message = "`"$($CommandParameterPair[$i].CommandName)`" is not a valid command name."
                }
                if ($global:CommandParameterPair[$i].ParameterName -eq "is an alias") {
                    $Message = "`"$($CommandParameterPair[$i].CommandName)`" is an alias of `"$((Get-Command $CommandParameterPair[$i].CommandName).ResolvedCommandName)`"."
                }
                if ($global:CommandParameterPair[$i].ParameterName -eq "doesn't follow the Capitalization Conventions") {
                    $Message = "`"$($CommandParameterPair[$i].CommandName)`" doesn't follow the Capitalization Conventions."
                }
                $Result = [Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord]@{
                    Message = $Message;
                    Extent = $Asts[$i].Extent;
                    RuleName = $PSCmdlet.MyInvocation.InvocationName;
                    Severity = "Error"
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

    end {}
}

function Measure-DifferentParameterSets {
    [CmdletBinding()]
    [OutputType([Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord[]])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.Language.ScriptBlockAst]
        $ScriptBlockAst
    )

    begin {}

    process {
        $Results = @()

        try {
            [ScriptBlock]$Predicate = {
                param([System.Management.Automation.Language.Ast]$Ast)

                if ($Ast -is [System.Management.Automation.Language.CommandAst]) {
                    [System.Management.Automation.Language.CommandAst]$CommandAst = $Ast
                    $CommandName = $CommandAst.GetCommandName()
                    $GetCommand = Get-Command $CommandName -ErrorAction SilentlyContinue
                    if (-not $?) {
                        # Command is not valid.
                        return $false
                    }
                    else {
                        foreach ($ParameterSet in $GetCommand.ParameterSets) {
                            # ParameterSets.Count is 0 when command is an alias.
                            $AllParametersInASet = $true
                            $Parameters = $ParameterSet.Parameters.Name + $ParameterSet.Parameters.Aliases
                            foreach ($CommandElement in $CommandAst.CommandElements) {
                                if ($CommandElement -is [System.Management.Automation.Language.CommandParameterAst]) {
                                    $ParameterName = ([System.Management.Automation.Language.CommandParameterAst]$CommandElement).ParameterName
                                    if ($ParameterName -notin $Parameters) {
                                        $AllParametersInASet = $false
                                        break
                                    }
                                }
                            }
                            if ($AllParametersInASet) {
                                break
                            }
                        }
                        if ($AllParametersInASet -eq $false) {
                            # Not all parameters in a same ParameterSet.
                            return $true
                        }
                    }
                }
                return $false
            }

            [System.Management.Automation.Language.Ast[]]$Asts = $ScriptBlockAst.FindAll($Predicate, $false)
            for ($i = 0; $i -lt $Asts.Count; $i++) {
                $Result = [Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord]@{
                    Message = "`"$($Asts[$i].Extent)`" has a parameter not in the same ParameterSet as others.";
                    Extent = $Asts[$i].Extent;
                    RuleName = $PSCmdlet.MyInvocation.InvocationName;
                    Severity = "Error"
                }
                $Results += $Result
            }
            return $Results
        }
        catch {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }

    end {}
}

function Measure-WrongParameterNameAndValue {
    [CmdletBinding()]
    [OutputType([Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord[]])]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.Language.ScriptBlockAst]
        $ScriptBlockAst
    )

    begin {}

    process {
        $Results = @()
        $global:CommandParameterPair = @()
        $global:Ast = $null

        try {
            [ScriptBlock]$Predicate = {
                param([System.Management.Automation.Language.Ast]$Ast)
                $global:Ast = $Ast
                if ($Ast -is [System.Management.Automation.Language.CommandElementAst] -and $Ast.Parent -is [System.Management.Automation.Language.CommandAst]) {
                    [System.Management.Automation.Language.CommandElementAst]$CommandElementAst = $Ast
                    $CommandAst = $CommandElementAst.Parent
                    $CommandName = $CommandAst.GetCommandName()
                    try {
                        $GetCommand = Get-Command $CommandName -ErrorAction Stop
                    }
                    catch {
                        return $false
                    }

                    if ($CommandElementAst -is [System.Management.Automation.Language.CommandParameterAst]) {
                        # This CommandElement is CommandParameter.
                        [System.Management.Automation.Language.CommandParameterAst]$CommandParameterAst = $CommandElementAst
                        $ParameterName = $CommandParameterAst.ParameterName
                        $ParameterNameNotAlias = $GetCommand.Parameters.Keys | where {
                            $ParameterName -in $GetCommand.Parameters.$_.Name -or
                            $ParameterName -in $GetCommand.Parameters.$_.Aliases
                        }
                        if ($ParameterNameNotAlias -ne $null) {
                            # Parameter is valid.
                            $index = $CommandAst.CommandElements.Extent.Text.IndexOf($CommandElementAst.Extent.Text)
                            $NextCommandElement = $CommandAst.CommandElements[$index + 1]
                            if ($GetCommand.Parameters.$ParameterNameNotAlias.SwitchParameter -eq $true) {
                                # Parameter is a SwitchParameter
                                if ($NextCommandElement -ne $null -and
                                $NextCommandElement -isnot [System.Management.Automation.Language.CommandParameterAst]) {
                                    # Can't assign a value to SwitchParameter.
                                    $global:CommandParameterPair += @{
                                        CommandName = $CommandName
                                        ParameterName = $ParameterName
                                        ExpressionToParameter = $NextCommandElement.Extent.Text
                                    }
                                    return $true
                                }
                            }
                            else {
                                # Parameter is not a SwitchParameter
                                if ($NextCommandElement -eq $null -or
                                $NextCommandElement -isnot [System.Management.Automation.Language.ExpressionAst]) {
                                    # Parameter must be assigned with a value.
                                    $global:CommandParameterPair += @{
                                        CommandName = $CommandName
                                        ParameterName = $ParameterName
                                        ExpressionToParameter = ""
                                    }
                                    return $true
                                }
                                else {
                                    # Next Command Element shouldn't be $null or of an incorrect type.
                                    if ($NextCommandElement -is [System.Management.Automation.Language.VariableExpressionAst]) {
                                        $NextCommandElementValue = Invoke-Expression ("$" + $NextCommandElement.VariablePath)
                                    }
                                    else {
                                        $NextCommandElementValue = $NextCommandElement.Extent.Text
                                    }
                                    $ConvertedObject = $NextCommandElementValue -as $GetCommand.Parameters.$ParameterNameNotAlias.ParameterType
                                    if ($ConvertedObject -eq $null) {
                                        $global:CommandParameterPair += @{
                                            CommandName = $CommandName
                                            ParameterName = $ParameterName
                                            ExpressionToParameter = $NextCommandElement.Extent.Text
                                        }
                                        return $true
                                    }
                                }
                            }
                        }
                    }
                    if ($CommandElementAst -is [System.Management.Automation.Language.ExpressionAst] -and
                    $CommandElementAst.Extent.Text -ne $CommandName) {
                        # This CommandElement is Expression and is not CommandName.
                        $index = $CommandAst.CommandElements.Extent.Text.IndexOf($CommandElementAst.Extent.Text)
                        $PreviousCommandElementAst = $CommandAst.CommandElements[$index - 1]
                        if ($PreviousCommandElementAst.GetType() -ne [System.Management.Automation.Language.CommandParameterAst]) {
                            # Previous Command Element should be a parameter name.
                            $global:CommandParameterPair += @{
                                CommandName = $CommandName
                                ParameterName = ""
                                ExpressionToParameter = $CommandElementAst.Extent.Text
                            }
                            return $true
                        }
                    }
                }
                return $false
            }

            [System.Management.Automation.Language.Ast[]]$Asts = $ScriptBlockAst.FindAll($Predicate, $false)
            for ($i = 0; $i -lt $Asts.Count; $i++) {
                if ($global:CommandParameterPair[$i].ExpressionToParameter -eq "") {
                    $Message = "`"$($CommandParameterPair[$i].CommandName) -$($CommandParameterPair[$i].ParameterName)`" must be assigned with a value."
                    $Severity = "Error"
                }
                elseif ($global:CommandParameterPair[$i].ParameterName -eq "") {
                    $Message = "`"$($CommandParameterPair[$i].CommandName) $($CommandParameterPair[$i].ExpressionToParameter)`" is not explicitly assigned to a parameter."
                    $Severity = "Warning"
                }
                else {
                    $Message = "`"$($CommandParameterPair[$i].CommandName) -$($CommandParameterPair[$i].ParameterName) $($CommandParameterPair[$i].ExpressionToParameter)`" is not a valid expression."
                    $Severity = "Warning"
                }
                $Result = [Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.DiagnosticRecord]@{
                    Message = $Message;
                    Extent = $Asts[$i].Extent;
                    RuleName = $PSCmdlet.MyInvocation.InvocationName;
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

    end {}
}

Export-ModuleMember -Function Measure-*
