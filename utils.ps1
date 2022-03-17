$SYNOPSIS_HEADER = "## SYNOPSIS"
$SYNTAX_HEADER = "## SYNTAX"
$DESCRIPTION_HEADER = "## DESCRIPTION"
$EXAMPLES_HEADER = "## EXAMPLES"
$PARAMETERS_HEADER = "## PARAMETERS"
$EXAMPLE_HEADER = "###"

class Example {
    [string]$Title
    [string]$Code
    [string]$Output
    [string]$Description
}


function Extract-ScriptFromMarkdown {
    param (
        [Parameter(Mandatory=$true)]
        [string]$MarkdownPath,
        [Parameter(Mandatory=$true)]
        [string]$OutputPath
    )


    if (!(Test-Path -Path $MarkdownPath)) {
        Write-Debug "$MarkdownPath does not exist"
    }
    
    if((Get-Item $MarkdownPath) -is [System.IO.DirectoryInfo]){
        $markdownList = Get-ChildItem -Path $MarkdownPath -File -Recurse -Include *.md
    }else{
        $markdownList = $MarkdownPath
    }

    foreach($markdown in $markdownList){
        $moduleName = (Get-Item -Path $markdown).Directory.Name
        $scriptPath = Join-Path -Path $OutputPath -ChildPath $moduleName
        $markdownName = [System.IO.Path]::GetFileNameWithoutExtension($markdown)

        # exclude $moduleName.md
        if($markdownName -eq $moduleName){
            Write-Debug "Skipping $moduleName.md ..."
            continue
        }
        
        if (!(Test-Path -Path $scriptPath)) {
            Write-Debug "Creating $scriptPath ..."
            $null = New-Item -ItemType Directory -Force -Path $scriptPath
        }

        Write-Debug "Extracting scripts from $markdown ..."
        
        $exampleCount= 0


        $markdownContent = Get-Content $markdown.FullName -Raw
        $indexOfExamples = $markdownContent.IndexOf($EXAMPLES_HEADER)
        $indexOfParameters = $markdownContent.IndexOf($PARAMETERS_HEADER)
        $examplesContent = $markdownContent.Substring($indexOfExamples, $indexOfParameters - $indexOfExamples)
        
        $cmdletName = $markdownName
        $exampleOjbects = @()

        # Write-Debug $examplesContent

    #         $ExamplesCodes = @()
    #         $ExamplesCodesIndexes = @()
    #         $ExamplesOutputs = @()
    #         $examplesDescriptions = @()


    #         $missingExampleTitle = 0
    #         $MissingExampleCode = 0
    #         $MissingExampleOutput = 0
    #         $MissingExampleDescription = 0
    #         $NeedSplitting = 0



            $examplesTitles = ($examplesContent | Select-String -Pattern "\n$EXAMPLE_HEADER.+" -AllMatches).Matches

            # Skip $EXAMPLES_HEADER
            $examples = $examplesContent -split "\n$EXAMPLE_HEADER.+" | Select-Object -Skip 1

            # Match example code
            foreach ($example in $examples)
            {
                $exampleCount++                
                $ExampleCodes = @()
                $ExampleCodesIndexes = @()
                
                # Write-Debug "$example"
                # Write-Debug $exampleCount

                $ExampleCodeBlock = ($example | Select-String -Pattern " *`````` *(.*\n)+ *`````` *" -AllMatches).Matches
                # Write-Debug $ExampleCodeBlock
               
                if ($ExampleCodeBlock.Count -eq 0)
                {
                    $MissingExampleCode++
                    $MissingExampleOutput++
                    # if ($example.Trim() -eq "")
                    # {
                    #     # Empty example
                    #     $MissingExampleDescription++
                    # }
                    # else
                    # {
                        # Only has descriptions
                        $examplesDescriptions += $example
                    # }
                }
                else
                # if ($ExampleCodeBlock.Count -eq 1)
                {
                    #$ExampleCodeLines = ($ExampleCodeBlock[0].Value | Select-String -Pattern "((\n(([A-Za-z \t\\:>])*(PS|[A-Za-z]:)(\w|[\\/\[\].\- ])*(>|&gt;)+( PS)*)*[ \t]*[A-Za-z]\w+-[A-Za-z]\w+\b(?!(-|   +\w)))|(\n(([A-Za-z \t\\:>])*(PS|[A-Za-z]:)(\w|[\\/\[\].\- ])*(>|&gt;)+( PS)*)*[ \t]*((@?\(.+\) *[|.-] *\w)|(\[.+\]\$)|(@{.+})|('[^\n\r']*' *[|.-] *\w)|(`"[^\n\r`"]*`" *[|.-] *\w)|\$)))([\w-~``'`"$= \t:;<>@()\[\]{},.+*/|\\&!?%#]*[``|] *(\n|\r\n))*[\w-~``'`"$= \t:;<>@()\[\]{},.+*/|\\&!?%#]*(?=\n|\r\n|#)" -CaseSensitive -AllMatches).Matches
                    #$ExampleCodeLines = ($ExampleCodeBlock[0].Value | Select-String -Pattern "\n(([A-Za-z \t])*(PS|[A-Za-z]:)(\w|[\\/\[\].\- ])*(>|&gt;)+( PS)*)*[ \t]*((([A-Za-z]\w+-[A-Za-z]\w+\b(?!(-|   +\w)))|((@?\(.+\) *[|.-] *\w)|(\[.+\]\$)|(@{.+})|('[^\n\r']*' *[|.-] *\w)|(`"[^\n\r`"]*`" *[|.-] *\w)|\$))([\w-~``'`"$= \t:;<>@()\[\]{},.+*/|\\&!?%#]*[``|][ \t]*(\n|\r\n)?)*([\w-~``'`"$= \t:;<>@()\[\]{},.+*/|\\&!?%#]*(?=\n|\r\n|#)))" -CaseSensitive -AllMatches).Matches
                    $RegexPattern = "\n(([A-Za-z \t])*(PS|[A-Za-z]:)(\w|[\\/\[\].\- ])*(>|&gt;)+( PS)*)*[ \t]*((([A-Za-z]\w+-[A-Za-z]\w+\b(.ps1)?(?!(-|   +\w)))|(" +
                    "(@?\((?>\((?<pair>)|[^\(\)]+|\)(?<-pair>))*(?(pair)(?!))\) *[|.-] *\w)|" +
                    "(\[(?>\[(?<pair>)|[^\[\]]+|\](?<-pair>))*(?(pair)(?!))\]\$)|" +
                    "(@{(?>{(?<pair>)|[^{}]+|}(?<-pair>))*(?(pair)(?!))})|" +
                    "('(?>'(?<pair>)|[^']+|'(?<-pair>))*(?(pair)(?!))' *[|.-] *\w)|" +
                    "((?<!``)`"(?>(?<!``)`"(?<pair>)|[\s\S]|(?<!``)`"(?<-pair>))*(?(pair)(?!))(?<!``)`" *[|.-] *\w)|" +
                    "\$))(?!\.)([\w-~``'`"$= \t:;<>@()\[\]{},.+*/|\\&!?%#]*[``|][ \t]*(\n|\r\n)?)*([\w-~``'`"$= \t:;<>@()\[\]{},.+*/|\\&!?%#]*(?=\n|\r\n|#)))"
                    $ExampleCodeLines = ($ExampleCodeBlock[0].Value | Select-String -Pattern $RegexPattern -CaseSensitive -AllMatches).Matches
                    if ($ExampleCodeLines.Count -eq 0)
                    {
                        $MissingExampleCode++
                        $MissingExampleOutput++
                    }
                    else
                    {
                        $ExampleCodesCount_Before = $ExampleCodes.Count

                        for ($i = 0; $i -lt $ExampleCodeLines.Count; $i++)
                        {
                            # CodeLines shouldn't end with "`", "\r", or "\n"
                            # $LastCharacter = $ExampleCodeBlock[0].Value.Substring($ExampleCodeBlock[0].Value.IndexOf($ExampleCodeLines[$i]) + $ExampleCodeLines[$i].Length - 1, 1)
                            # if ($LastCharacter -ne "``" -and $LastCharacter -ne "`r" -and $LastCharacter -ne "`n")
                            # {
                                # If a codeline contains " :", it's not a codeline but an "| Format-List" output line.
                                if ($ExampleCodeLines[$i].Value -notmatch " : *\w")
                                {
                                    $ExampleCodes += $ExampleCodeLines[$i]
                                    $ExampleCodesIndexes += $examplesContent.IndexOf($example) + $ExampleCodeBlock[0].Index + $ExampleCodeLines[$i].Index
                                }
                            # }
                        }
                        # If nothing was added
                        if ($ExampleCodes.Count -eq $ExampleCodesCount_Before)
                        {
                            # $MissingExampleCode++
                            # $MissingExampleOutput++
                        }
                        else
                        {
                            $ExamplesOutputsCount_Before = $ExamplesOutputs.Count

                            # Content between codelines is output
                            for ($i = $ExampleCodesCount_Before; $i -lt $ExampleCodes.Count - 1; $i++)
                            {
                                $StartIndex = $ExampleCodes[$i].Index + $ExampleCodes[$i].Length
                                $NextStartIndex = $ExampleCodes[$i + 1].Index
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
                            $ExampleOutput = $ExampleCodeBlock[0].Value.SubString($ExampleCodes[-1].Index + $ExampleCodes[-1].Length, $ExampleCodeBlock[0].Length - $ExampleCodes[-1].Index - $ExampleCodes[-1].Length - 3).Trim()
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
                            # From the start of the codeblock to the 1st codeline is description, if it's not empty.
                            $StartIndex = $ExampleCodeBlock[0].Value.IndexOf("`n")
                            $EndIndex = $ExampleCodes[$ExampleCodesCount_Before].Index
                            if ($ExampleCodeBlock[0].Value.SubString($StartIndex, $EndIndex - $StartIndex).Trim() -ne "")
                            {
                                $examplesDescriptions += $ExampleCodeBlock[0].Value.SubString($StartIndex, $EndIndex - $StartIndex)
                            }

                            if ($ExamplesOutputsCount_Before -ne $ExamplesOutputs.Count)
                            {
                                # $NeedSplitting++
                                for ($i = $ExamplesOutputsCount_Before; $i -lt $ExamplesOutputs.Count; $i++)
                                {
                                    $NeedSplitting++
                                    if ($ExamplesOutputs[$i] -match "\n``````Output")
                                    {
                                        $NeedSplitting--
                                        break
                                    }
                                }
                            }
                        }
                    }

                    # From the start to the start of the codeblock and from the end of the codeblock to the end are example description.
                    $exampleDescription = $example.SubString(0, $ExampleCodeBlock[0].Index) + $example.SubString($ExampleCodeBlock[0].Index + $ExampleCodeBlock[0].Length).Trim()
                    # if ($exampleDescription -eq "")
                    # {
                    #     $MissingExampleDescription++
                    # }
                    # else
                    # {
                        $examplesDescriptions += $exampleDescription
                    # }
                }

                # Write-Debug $exampleDescription

                # Delete prompts.
                $ExamplesCodes += $ExampleCodes
                $ExamplesCodesIndexes += $ExampleCodesIndexes
                for ($i = $ExampleCodes.Count - 1; $i -ge 0; $i--)
                {
                    $NewCode = $ExampleCodes[$i] -replace "\n([A-Za-z \t\\:>])*(PS|[A-Za-z]:)(\w|[\\/\[\].\- ])*(>|&gt;)+( PS)*[ \t]*", "`n"
                    $NewCode = $NewCode -replace "(?<=[A-Za-z]\w+-[A-Za-z]\w+)\.ps1", ""
                    $ExampleCodes[$i] = $NewCode
                }
                # Output codes by example.
                $ExampleCodes | Set-Content -Path "$scriptPath\$cmdletName-Example$exampleCount.ps1" -Encoding UTF8 -Force

            # # StatusTable
            # $Examples = $examplesTitles.Count

            # $StatusTable += New-Object PSObject -Property @{
            #     Module = $Module
            #     Cmdlet = $cmdletName
            #     Examples = $Examples
            #     ShouldBeDeleted = $ShouldBeDeleted
            # }

    #         if ($ShouldBeDeleted -eq $null)
    #         {
    #             # If no examples
    #             if ($Examples -eq 0)
    #             {
    #                 $missingExampleTitle++
    #                 $MissingExampleCode++
    #                 $MissingExampleOutput++
    #                 $MissingExampleDescription++
    #             }
    #             else
    #             {
    #                 $missingExampleTitle += ($examplesTitles | Select-String -Pattern "{{[A-Za-z ]*}}").Count
    #                 $MissingExampleCode += ($ExamplesCodes | Select-String -Pattern "{{[A-Za-z ]*}}").Count
    #                 $MissingExampleOutput += ($ExamplesOutputs | Select-String -Pattern "{{[A-Za-z ]*}}").Count
    #                 $MissingExampleDescription += ($examplesDescriptions | Select-String -Pattern "{{[A-Za-z ]*}}").Count
    #             }

    #             # MissingTable
    #             if ($missingDescription -ne 0 -or $missingExampleTitle -ne 0 -or $MissingExampleCode -ne 0 -or $MissingExampleOutput -ne 0 -or $MissingExampleDescription -ne 0)
    #             {
    #                 $MissingTable += New-Object PSObject -Property @{
    #                     Module = $Module
    #                     Cmdlet = $cmdletName
    #                     MissingSynopsisOrDescription = $missingSynopsis + $missingDescription
    #                     MissingExampleTitle = $missingExampleTitle
    #                     MissingExampleCode = $MissingExampleCode
    #                     MissingExampleOutput = $MissingExampleOutput
    #                     MissingExampleDescription = $MissingExampleDescription
    #                 }
    #             }
    #             # DeletePromptAndSeparateOutputTable
    #             if ($ExampleCodeBlock.Count -ne 0)
    #             {
    #                 $NeedDeleting = ($ExampleCodeBlock[0].Value | Select-String -Pattern "\n([A-Za-z \t\\:>])*(PS|[A-Za-z]:)(\w|[\\/\[\].\- ])*(>|&gt;)+( PS)*[ \t]*" -CaseSensitive).Count
    #                 if ($NeedDeleting -ne 0 -or $NeedSplitting -ne 0)
    #                 {
    #                     $DeletePromptAndSeparateOutputTable += New-Object PSObject -Property @{
    #                         Module = $Module
    #                         Cmdlet = $cmdletName
    #                         NeedDeleting = $NeedDeleting
    #                         NeedSplitting = $NeedSplitting
    #                     }
    #                 }
    #             }

    #             # Deleting prompts and splitting
    #             for ($i = $ExamplesCodes.Count - 1; $i -ge 0; $i--)
    #             {
    #                 $NewCode = $ExamplesCodes[$i] -replace "\n([A-Za-z \t\\:>])*(PS|[A-Za-z]:)(\w|[\\/\[\].\- ])*(>|&gt;)+( PS)*[ \t]*", "`n"
    #                 $NewCode = $NewCode -replace "(?<=[A-Za-z]\w+-[A-Za-z]\w+)\.ps1", ""
    #                 $markdownContent = $markdownContent.Substring(0, $indexOfExamples + $ExamplesCodesIndexes[$i]) + $NewCode + $markdownContent.Substring($indexOfExamples + $ExamplesCodesIndexes[$i] + $ExamplesCodes[$i].Length)
    #                 $ExamplesCodes[$i] = $NewCode
    #             }
    #             $null = mkdir -Path "newmd\$Module" -ErrorAction SilentlyContinue
    #             [IO.File]::WriteAllText("newmd\$Module\$cmdletName.md", $markdownContent, (New-Object Text.UTF8Encoding($false)))
    #             # Analyze codes.
    #             $null = mkdir -Path "newps\$Module" -ErrorAction SilentlyContinue
    #             [IO.File]::WriteAllText("newps\$Module\$cmdletName.ps1", $ExamplesCodes, (New-Object Text.UTF8Encoding($false)))
    #         }
        }
        
        # $ResultsTable | Export-Csv newps\$Module.csv -NoTypeInformation
    }
    
    return (Get-ChildItem -Path "$OutputPath" -Recurse -Include *.ps1)
}





function Detect-IncompleteSection{
    param (
        [Parameter(Mandatory=$true)]
        [string]$MarkdownPath
    )

    foreach($markdown in $mardownList){
        $moduleName = $markdown.Parent.Name
        $scriptPath = Join-Path -Path $OutputPath -ChildPath $moduleName
        $markdownName = [System.IO.Path]::GetFileNameWithoutExtension($markdown)
        
        # exclude Az.{$moduleName}.md
        if($markdownName -eq $moduleName){
            continue
        }

        $missingSynopsis = 0
        $missingDescription = 0

        $markdownContent = Get-Content $markdown.FullName -Raw
        
        $indexOfSynopsis = $markdownContent.IndexOf($SYNOPSIS_HEADER)
        $indexOfSyntax = $markdownContent.IndexOf($SYNTAX_HEADER)

        $indexOfDescription = $markdownContent.IndexOf($DESCRIPTION_HEADER)
        $indexOfExamples = $markdownContent.IndexOf($EXAMPLES_HEADER)

        # Check if Synopsis section exists
        # bez: bug exists if Syntax section is empty
        if (($indexOfSynopsis -eq -1) -or
        ("" -eq $markdownContent.Substring($indexOfSynopsis + $SYNOPSIS_HEADER.Length, $indexOfSyntax - $indexOfSynopsis - $SYNOPSIS_HEADER.Length).Trim()))
        {
            $missingSynopsis += 1
        }
        
        # Check if Description section exists
        # bez: bug exists if Examples section is empty
        if (($indexOfDescription -eq -1) -or
        ("" -eq $markdownContent.Substring($indexOfDescription + $DESCRIPTION_HEADER.Length, $indexOfExamples - $indexOfDescription - $DESCRIPTION_HEADER.Length).Trim()))
        {                
            $missingDescription += 1
        }

        Write-Debug $markdown.FullName, "missingSynopsis: ", "$missingSynopsis", "missingDescription: ", "$missingDescription"
    }

}

class DiagnosticResult{
    [string] $CmdletName
    [string] $ViolationCategory
    [string] $Message
}


function Filter-Result{
    param (
        [Parameter(Mandatory=$true)]
        [object]$DiagnosticRecords
    )

    $results = @()

    foreach($record in $DiagnosticRecords) {
        if(![System.String]::IsNullOrEmpty($record)){
            $result = [DiagnosticResult]::new()
            $result.CmdletName = $record.ScriptName.Split("-Example")[0]
            $result.ViolationCategory = $record.RuleName
            $result.Message = $record.Message
            $results += $result
        }
    }

    return $results
}