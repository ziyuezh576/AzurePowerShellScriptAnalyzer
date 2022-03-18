#Requires -Modules PSScriptAnalyzer

[CmdletBinding()]
param (
    [Parameter(Mandatory, HelpMessage = "Input searching path. Leave it empty for current path.")]
    [AllowEmptyString()]
    [string[]]$ScriptsPath,
    [switch]$Recurse,
    [Parameter(HelpMessage = "PSScriptAnalyzer custom rules path. Supports wildcard.")]
    [string[]]$RulePath,
    [string]$OutputPath = ".",
    [switch]$OutputByScriptFile,
    [switch]$IncludeDefaultRules
)

$ScriptsPath = "$env:USERPROFILE\source\repos\azure-docs-powershell-samples/virtual-machine", "$env:USERPROFILE\source\repos\azure-docs-powershell-samples/azure-migrate"
$RulePath = "$env:USERPROFILE\source\repos\AzurePowerShellScriptAnalyzer\AnalyzeRules\Measure-Examples.psm1"

$resultsTable = @()

# Get-ChildItem $ScriptsPath -Recurse:$Recurse.IsPresent -Attributes !Directory -Filter "*.ps1" -ErrorAction Stop | foreach {
Get-ChildItem $ScriptsPath -Recurse -Attributes !Directory -Filter "*.ps1" -ErrorAction Stop | foreach {
    Write-Output "Analyzing file $($_.FullName) ..."
    $results = @()
    if ($RulePath -eq $null) {
        $results = Invoke-ScriptAnalyzer -Path $_.FullName -IncludeDefaultRules:$IncludeDefaultRules.IsPresent
    }
    else {
        $results = Invoke-ScriptAnalyzer -Path $_.FullName -CustomRulePath $RulePath -IncludeDefaultRules:$IncludeDefaultRules.IsPresent
    }
    $results = $results | Select-Object -Property ScriptName, RuleName, Message, Extent
    if ($OutputByScriptFile.IsPresent) {
        $results | Export-Csv "$OutputPath\$($_.BaseName).csv" -NoTypeInformation
    }
    $resultsTable += $results
}

# Summarize analysis results
$resultsTable | Export-Csv "$OutputPath\azure-docs-powershell-samples.csv" -NoTypeInformation
