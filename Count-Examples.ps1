[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage="Input searching path. Press Enter for current path.")]
    [AllowEmptyString()]
    [string]$AzurePowerShellSrcPath,
    [string]$MicrosoftDocsAzpsPath
)

process {
    class Status {
        [string]$Module
        [string]$Cmdlet
        [int]$Examples
        [string]$ShouldBeDeleted
    }

    class Missing {
        [string]$Module
        [string]$Cmdlet
        [int]$MissingSynopsisOrDescription
        [int]$MissingExampleTitle
        [int]$MissingExampleCode
        [int]$MissingExampleOutput
        [int]$MissingExampleDescription
    }

    class DeletingSeparating {
        [string]$Module
        [string]$Cmdlet
        [int]$NeedDeleting
        [int]$NeedSeparating
    }

    $AzurePowerShellSrcPath = "C:\Users\v-ziyzhe\source\repos\azure-powershell\src"
    $MicrosoftDocsAzpsPath = "C:\Users\v-ziyzhe\source\repos\azure-docs-powershell\azps-7.0.0"

    $StatusTable = @()
    $MissingTable = @()
    $DeletePromptAndSeparateOutputTable = @()

    if ($MicrosoftDocsAzpsPath -ne "")
    {
        $PublishedFiles = (dir -r $MicrosoftDocsAzpsPath -Filter "*.md").Name
    }

    dir $AzurePowerShellSrcPath -r -Attributes Directory -Filter "help" -ErrorAction Stop | foreach `
    {
        $Module = (dir "$($_.FullName)\.." -Filter *.psd1).BaseName
        Write-Output "Searching in Module $Module ..."
        dir $_.FullName -Filter *.md | foreach `
        {
            # The document is not an overview or readme.
            if ($_.BaseName -match "[A-Z]\w+-[A-Z]\w+")
            {
                Write-Output "Searching in file $($_.FullName) ..."
                $Cmdlet = $_.BaseName
                $FileContent = cat $_.FullName -Raw

                $IndexOfSynopsis  = $FileContent.IndexOf("## SYNOPSIS")
                $IndexOfSyntax = $FileContent.IndexOf("## SYNTAX")
                $IndexOfDescription = $FileContent.IndexOf("## DESCRIPTION")
                $IndexOfExamples = $FileContent.IndexOf("## EXAMPLES")
                $IndexOfParameters = $FileContent.IndexOf("## PARAMETERS")

                $ExamplesCodes = @()
                $ExamplesOutputs = @()
                $ExamplesDescriptions = @()
                $MissingExampleTitle = 0
                $MissingExampleCode = 0
                $MissingExampleOutput = 0
                $MissingExampleDescription = 0
                $NeedSeparating = 0

                # If Synopsis section exists
                if ($IndexOfSynopsis -ne -1)
                {
                    $SynopsisContent = $FileContent.Substring($IndexOfSynopsis + "## SYNOPSIS".Length, $IndexOfSyntax - $IndexOfSynopsis - "## SYNOPSIS".Length)
                    if ($SynopsisContent.Trim() -eq "")
                    {
                        $MissingSynopsis = 1
                    }
                    else
                    {
                        $MissingSynopsis = ($SynopsisContent | Select-String -Pattern "{{[A-Za-z ]*}}").Count
                    }
                }
                else
                {
                    $MissingSynopsis = 1
                }

                # If Description section exists
                if ($IndexOfDescription -ne -1)
                {
                    $DescriptionContent = $FileContent.Substring($IndexOfDescription + "## DESCRIPTION".Length, $IndexOfExamples - $IndexOfDescription - "## DESCRIPTION".Length)
                    if ($DescriptionContent.Trim() -eq "")
                    {
                        $MissingDescription = 1
                    }
                    else
                    {
                        $MissingDescription = ($DescriptionContent | Select-String -Pattern "{{[A-Za-z ]*}}").Count
                    }
                }
                else
                {
                    $MissingDescription = 1
                }

                $ExamplesContent = $FileContent.Substring($IndexOfExamples, $IndexOfParameters - $IndexOfExamples)
                $ExamplesTitles = ($ExamplesContent | Select-String -Pattern "\n###.+" -AllMatches).Matches
                $ExamplesContentArray = $ExamplesContent -split "\n###.+" | Select-Object -Skip 1
                foreach ($ExampleContent in $ExamplesContentArray)
                {
                    $ExampleCodeBlock = ($ExampleContent | Select-String -Pattern " *`````` *(.*\n)+ *`````` *" -AllMatches).Matches
                    if ($ExampleCodeBlock.Count -eq 0)
                    {
                        $MissingExampleCode++
                        $MissingExampleOutput++
                        # if ($ExampleContent.Trim() -eq "")
                        # {
                        #     # Empty example
                        #     $MissingExampleDescription++
                        # }
                        # else
                        # {
                            # Only has descriptions
                            $ExamplesDescriptions += $ExampleContent
                        # }
                    }
                    else
                    # if ($ExampleCodeBlock.Count -eq 1)
                    {
                        $ExampleCodeLines = ($ExampleCodeBlock[0].Value | Select-String -Pattern "((\n(.*(PS|[A-Za-z]:).*(>|&gt;)( PS)*)*\s*[A-Za-z(]\w+-[A-Za-z](\w|\))+)|(\n(.*(PS|[A-Za-z]:).*(>|&gt;)( PS)*)*\s*((@?\(.+\) *[|.-] *\w)|(\[.+\]\$)|(@{.+})|('[^\n\r']*' *[|.-] *\w)|(`"[^\n\r`"]*`" *[|.-] *\w)|\$)))([\w-~``'`"$= \t:;<>@()\[\]{},.+*/|\\&!?%]*[``|] *(\n|\r\n))*[\w-~``'`"$= \t:;<>@()\[\]{},.+*/|\\&!?%]*(?=\n|\r\n|#)" -CaseSensitive -AllMatches).Matches
                        # $ExampleCodeLines = ($ExampleCodeBlock[0].Value | Select-String -Pattern "((\n(.*(PS|[A-Za-z]:).*(>|&gt;)( PS)*)*\s*(\$\w+( *(=|\|) *))*[A-Z(]\w+-[A-Z](\w|\))+)|(\n(.*(PS|[A-Za-z]:).*(>|&gt;)( PS)*)*\s*(\$\w+( *(=|\|) *))*(([@\$]*\(.+\))|(\[.+\]\$)|(@{[\S\s]+})|(('|`")[^\n\r'`"]*('|`")))))([\w-~``'`"$= \t:;<>@()\[\]{},.+*/|\\&!?%]*`` *(\n|\r\n))*[\w-~``'`"$= \t:;<>@()\[\]{},.+*/|\\&!?%]*(?=\n|\r\n|#)" -AllMatches).Matches
                        if ($ExampleCodeLines.Count -eq 0)
                        {
                            $MissingExampleCode++
                            $MissingExampleOutput++
                        }
                        else
                        {
                            $ExamplesCodesCount_Before = $ExamplesCodes.Count

                            for ($i = 0; $i -lt $ExampleCodeLines.Count; $i++)
                            {
                                # CodeLines shouldn't end with "`", "\r", or "\n"
                                $LastCharacter = $ExampleCodeBlock[0].Value.Substring($ExampleCodeBlock[0].Value.IndexOf($ExampleCodeLines[$i]) + $ExampleCodeLines[$i].Length - 1, 1)
                                if ($LastCharacter -ne "``" -and $LastCharacter -ne "`r" -and $LastCharacter -ne "`n")
                                {
                                    # If a codeline contains " :", it's not a codeline but an "| Format-List" output line.
                                    if (!$ExampleCodeLines[$i].Value.Contains(" :"))
                                    {
                                        $ExamplesCodes += $ExampleCodeLines[$i]
                                    }
                                }
                            }
                            # If nothing was added
                            if ($ExamplesCodes.Count -eq $ExamplesCodesCount_Before)
                            {
                                # $MissingExampleCode++
                                # $MissingExampleOutput++
                            }
                            else
                            {
                                $ExamplesOutputsCount_Before = $ExamplesOutputs.Count

                                # Content between codelines is output
                                for ($i = $ExamplesCodesCount_Before; $i -lt $ExamplesCodes.Count - 1; $i++)
                                {
                                    $StartIndex = $ExamplesCodes[$i].Index + $ExamplesCodes[$i].Length
                                    $NextStartIndex = $ExamplesCodes[$i + 1].Index
                                    if ($ExampleCodeBlock[0].Value.SubString($StartIndex, $NextStartIndex - $StartIndex).Trim() -ne "")
                                    {
                                        # If an output line starts with "-", it's an incomplete codeline
                                        $ExampleOutput = $ExampleCodeBlock[0].Value.SubString($StartIndex, $NextStartIndex - $StartIndex).Trim()
                                        # if ($ExampleOutput -match "^-\w")
                                        # {
                                        #     $MissingExampleCode++
                                        # }
                                        # else
                                        # {
                                            if ($ExampleOutput -ne "")
                                            {
                                                $ExamplesOutputs += $ExampleOutput
                                            }
                                        # }
                                    }
                                }
                                # From the end of the last codeline to the end is output ("```" in the end is excluded)
                                # If an output line starts with "-", it's an incomplete codeline
                                $ExampleOutput = $ExampleCodeBlock[0].Value.SubString($ExamplesCodes[-1].Index + $ExamplesCodes[-1].Length, $ExampleCodeBlock[0].Length - $ExamplesCodes[-1].Index - $ExamplesCodes[-1].Length - 3).Trim()
                                # if ($ExampleOutput -match "^-\w")
                                # {
                                #     $MissingExampleCode++
                                # }
                                # else
                                # {
                                    if ($ExampleOutput -ne "")
                                    {
                                        $ExamplesOutputs += $ExampleOutput
                                    }
                                # }
                                # From the start to the 1st codeline is also code, if it's not empty.
                                $StartIndex = $ExampleCodeBlock[0].Value.IndexOf("`n")
                                $EndIndex = $ExamplesCodes[$ExamplesCodesCount_Before].Index
                                if ($ExampleCodeBlock[0].Value.SubString($StartIndex, $EndIndex - $StartIndex).Trim() -ne "")
                                {
                                    $ExamplesCodes += $ExampleCodeBlock[0].Value.SubString($StartIndex, $EndIndex - $StartIndex)
                                }

                                if ($ExamplesOutputsCount_Before -ne $ExamplesOutputs.Count)
                                {
                                    # $NeedSeparating++
                                    for ($i = $ExamplesOutputsCount_Before; $i -lt $ExamplesOutputs.Count; $i++)
                                    {
                                        $NeedSeparating++
                                        if ($ExamplesOutputs[$i] -match "\n``````Output")
                                        {
                                            $NeedSeparating--
                                            break
                                        }
                                    }
                                }
                            }
                        }

                        # From the start to the start of the codeblock and from the end of the codeblock to the end are example description.
                        $ExampleDescription = $ExampleContent.SubString(0, $ExampleCodeBlock[0].Index) + $ExampleContent.SubString($ExampleCodeBlock[0].Index + $ExampleCodeBlock[0].Length)
                        # if ($ExampleDescription.Trim() -eq "")
                        # {
                        #     $MissingExampleDescription++
                        # }
                        # else
                        # {
                            $ExamplesDescriptions += $ExampleDescription
                        # }
                    }
                }

                # StatusTable
                $Examples = $ExamplesTitles.Count
                if ($PublishedFiles -ne $null -and !$PublishedFiles.Contains($_.Name))
                {
                    $ShouldBeDeleted = "Y"
                }
                else
                {
                    $ShouldBeDeleted = $null
                }
                $StatusTable += New-Object Status -Property @{
                    "Module" = $Module;
                    "Cmdlet" = $Cmdlet;
                    "Examples" = $Examples;
                    "ShouldBeDeleted" = $ShouldBeDeleted
                }

                if ($ShouldBeDeleted -eq $null)
                {
                    # If no examples
                    if ($Examples -eq 0)
                    {
                        $MissingExampleTitle++
                        $MissingExampleCode++
                        $MissingExampleOutput++
                        $MissingExampleDescription++
                    }
                    else
                    {
                        $MissingExampleTitle += ($ExamplesTitles | Select-String -Pattern "{{[A-Za-z ]*}}").Count
                        $MissingExampleCode += ($ExamplesCodes | Select-String -Pattern "{{[A-Za-z ]*}}").Count
                        $MissingExampleOutput += ($ExamplesOutputs | Select-String -Pattern "{{[A-Za-z ]*}}").Count
                        $MissingExampleDescription += ($ExamplesDescriptions | Select-String -Pattern "{{[A-Za-z ]*}}").Count
                    }

                    # MissingTable
                    if ($MissingDescription -ne 0 -or $MissingExampleTitle -ne 0 -or $MissingExampleCode -ne 0 -or $MissingExampleOutput -ne 0 -or $MissingExampleDescription -ne 0)
                    {
                        $MissingTable += New-Object Missing -Property @{
                            "Module" = $Module;
                            "Cmdlet" = $Cmdlet;
                            "MissingSynopsisOrDescription" = $MissingSynopsis + $MissingDescription;
                            "MissingExampleTitle" = $MissingExampleTitle;
                            "MissingExampleCode" = $MissingExampleCode;
                            "MissingExampleOutput" = $MissingExampleOutput;
                            "MissingExampleDescription" = $MissingExampleDescription
                        }
                    }
                    # DeletePromptAndSeparateOutputTable
                    $NeedDeleting = ($ExamplesCodes | Select-String -Pattern ".*(PS|[A-Za-z]:).*(>|&gt;)( PS)*\s*" -CaseSensitive).Count
                    if ($NeedDeleting -ne 0 -or $NeedSeparating -ne 0)
                    {
                        $DeletePromptAndSeparateOutputTable += New-Object DeletingSeparating -Property @{
                            "Module" = $Module;
                            "Cmdlet" = $Cmdlet;
                            "NeedDeleting" = $NeedDeleting;
                            "NeedSeparating" = $NeedSeparating
                        }
                    }
                }
            }
        }
    }

    $StatusTable | Export-Csv Status.csv -NoTypeInformation
    $MissingTable | Export-Csv Missing.csv -NoTypeInformation
    $DeletePromptAndSeparateOutputTable | Export-Csv DeletingSeparating.csv -NoTypeInformation
}
