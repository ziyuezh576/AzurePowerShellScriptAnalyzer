#Requires -Modules PSScriptAnalyzer

[CmdletBinding(DefaultParameterSetName = "Markdown")]
param (
    [Parameter(Mandatory, HelpMessage = "Markdown searching paths. Empty for current path. Supports wildcard.", ParameterSetName = "Markdown")]
    [AllowEmptyString()]
    [string[]]$MarkdownPaths,
    [Parameter(Mandatory, HelpMessage = "PowerShell scripts searching paths. Empty for current path. Supports wildcard.", ParameterSetName = "Script")]
    [AllowEmptyString()]
    [string[]]$ScriptPaths,
    [Parameter(HelpMessage = "PSScriptAnalyzer custom rules paths. Empty for current path. Supports wildcard.")]
    [string[]]$RulePaths,
    [switch]$Recurse,
    [switch]$IncludeDefaultRules,
    [string]$OutputPath = "output",
    [Parameter(ParameterSetName = "Markdown")]
    [switch]$AnalyzeScriptsInFile,
    [Parameter(ParameterSetName = "Markdown")]
    [switch]$OutputScriptsInFile,
    [switch]$OutputResultsByModule,
    [switch]$CleanScripts
)

. $PSScriptRoot\utils.ps1

if ($PSCmdlet.ParameterSetName -eq "Markdown") {
    $ScriptsByExamplePath = ".\ScriptsByExample"
    $scaleTable = @()
    $missingTable = @()
    $deletePromptAndSeparateOutputTable = @()
}
$analysisResultsTable = @()
$null = New-Item -ItemType Directory -Path $OutputPath -ErrorAction SilentlyContinue

if ($PSCmdlet.ParameterSetName -eq "Markdown") {
    @() + (Get-Item $MarkdownPaths) + (Get-ChildItem $MarkdownPaths -Recurse:$Recurse.IsPresent -Attributes Directory) | foreach {
        # Parent folder name
        $module = (Get-Item $_).Name -eq "help" ? (Get-ChildItem $_.Parent -Attributes !Directory -Filter *.psd1)[0].BaseName : (Get-Item $_).Name
        Get-ChildItem $_ -Attributes !Directory -Filter *.md | foreach {
            # exclude Az.*.md and README.md
            if ($_.BaseName -match "^[A-Z]\w+-[A-Z]\w+") {
                Write-Output "Searching in file $($_.Name) ..."
                $cmdlet = $_.BaseName
                $result = Measure-SectionMissingAndOutputScript $module $cmdlet $_.FullName `
                    -OutputScriptsInFile:$OutputScriptsInFile.IsPresent `
                    -OutputPath $OutputPath\$ScriptsByExamplePath
                $scaleTable += $result.Scale
                $missingTable += $result.Missing
                $deletePromptAndSeparateOutputTable += $result.DeletePromptAndSeparateOutput
            }
        }
    }
    if ($AnalyzeScriptsInFile.IsPresent) {
        $ScriptPaths = "$OutputPath\$ScriptsByExamplePath"
    }
    # Summarize analysis results
    $scaleTable | Export-Csv "$OutputPath\Scale.csv" -NoTypeInformation
    $missingTable | where {$_ -ne $null} | Export-Csv "$OutputPath\Missing.csv" -NoTypeInformation
    $deletePromptAndSeparateOutputTable | where {$_ -ne $null} | Export-Csv "$OutputPath\DeletingSeparating.csv" -NoTypeInformation
}
if ($PSCmdlet.ParameterSetName -eq "Script" -or $AnalyzeScriptsInFile.IsPresent) {
    # Analyze codes
    $analysisResultsTable = @()
    @() + (Get-Item $ScriptPaths) + (Get-ChildItem $ScriptPaths -Recurse:$Recurse.IsPresent -Attributes Directory) | foreach {
        # Parent folder name
        $module = (Get-Item $_).Name
        $analysisResults = @()
        Get-ChildItem $_ -Attributes !Directory -Filter "*.ps1" -ErrorAction Stop | foreach {
            Write-Output "Analyzing file $($_.Name) ..."
            $analysisResults += Get-ScriptAnalyzerResult $module $_.FullName $RulePaths -IncludeDefaultRules:$IncludeDefaultRules.IsPresent -ErrorAction Continue
        }
        if ($OutputResultsByModule.IsPresent -and $analysisResults.Count -ne 0) {
            $analysisResults | Export-Csv "$OutputPath\$module.csv" -NoTypeInformation
        }
        $analysisResultsTable += $analysisResults
    }
    # Summarize analysis results
    $analysisResultsTable | where {$_ -ne $null} | Export-Csv "$OutputPath\Results-$(Get-Date -UFormat %s).csv" -NoTypeInformation
}

# Clean caches
if ($CleanScripts.IsPresent) {
    Remove-Item $ScriptPaths -Exclude *.csv -Recurse -ErrorAction Continue
}
