#Requires -Modules PSScriptAnalyzer

[CmdletBinding()]
param (
    [Parameter(Mandatory, HelpMessage = "Input searching path. Leave it empty for current path.")]
    [AllowEmptyString()]
    [string]$AzurePowerShellSrcPath,
    [string]$AzureDocsPowerShellAzpsPath,
    [Parameter(HelpMessage = "PSScriptAnalyzer custom rules path. Supports wildcard.")]
    [string[]]$RulePath,
    [string]$OutputPath = ".",
    [switch]$AnalyzeExampleScript,
    [switch]$IncludeDefaultRules,
    [switch]$OutputExampleScript,
    [switch]$CleanCache
)

. "$PSScriptRoot/utils.ps1"

$AzurePowerShellSrcPath = "$env:USERPROFILE\source\repos\azure-powershell\src"
$AzureDocsPowerShellAzpsPath = "$env:USERPROFILE\source\repos\azure-docs-powershell\azps-7.3.0"
$RulePath = "$env:USERPROFILE\source\repos\AzurePowerShellScriptAnalyzer\AnalyzeRules\Measure-Examples.psm1"

$scriptsByExamplePath = ".\ScriptsByExample"
$statusTable = @()
$missingTable = @()
$deletePromptAndSeparateOutputTable = @()
$resultsTable = @()

if ($AzureDocsPowerShellAzpsPath -ne "") {
    $publishedCmdletDocs = (Get-ChildItem -Recurse $AzureDocsPowerShellAzpsPath -Filter "*.md").BaseName
}

Get-ChildItem $AzurePowerShellSrcPath -Recurse -Attributes Directory -Filter "help" -ErrorAction Stop | foreach {
    $module = (Get-ChildItem "$($_.FullName)\.." -Filter *.psd1).BaseName
    Write-Output "Searching in Module $module ..."
    $analysisResultsTable = @()
    Get-ChildItem $_.FullName -Filter *.md | foreach {
        # exclude Az.*.md and README.md
        if ($_.BaseName -match "^[A-Z]\w+-[A-Z]\w+$") {
            Write-Output "Searching in file $($_.FullName) ..."
            $cmdlet = $_.BaseName
            $result = Measure-SectionMissingAndScriptError $module $cmdlet $_.FullName $publishedCmdletDocs `
                -RulePath $RulePath `
                -AnalyzeExampleScript:$AnalyzeExampleScript.IsPresent `
                -IncludeDefaultRules:$IncludeDefaultRules.IsPresent `
                -OutputExampleScript:$OutputExampleScript.IsPresent `
                -OutputPath $OutputPath\$scriptsByExamplePath
            $statusTable += $result.Status
            $missingTable += $result.Missing
            $deletePromptAndSeparateOutputTable += $result.DeletePromptAndSeparateOutput
            $analysisResultsTable += $result.AnalysisResults
        }
    }

    # Summarize analysis results
    if ($AnalyzeExampleScript.IsPresent) {
        $analysisResultsTable | where {$_ -ne $null} | Export-Csv $OutputPath\$scriptsByExamplePath\$module.csv -NoTypeInformation
    }
    $resultsTable += $analysisResultsTable
}

# Clean caches
if ($CleanCache.IsPresent) {
    Remove-Item "$OutputPath\$scriptsByExamplePath" -Exclude *.csv -Recurse -ErrorAction Continue
}

$null = New-Item -ItemType Directory -Path $OutputPath -ErrorAction SilentlyContinue
$statusTable | Export-Csv "$OutputPath\Status.csv" -NoTypeInformation
$missingTable | where {$_ -ne $null} | Export-Csv "$OutputPath\Missing.csv" -NoTypeInformation
$deletePromptAndSeparateOutputTable | where {$_ -ne $null} | Export-Csv "$OutputPath\DeletingSeparating.csv" -NoTypeInformation
$resultsTable | Export-Csv "$OutputPath\Results.csv" -NoTypeInformation
