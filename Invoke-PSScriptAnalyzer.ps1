# ----------------------------------------------------------------------------------
    #
    # Copyright Microsoft Corporation
    # Licensed under the Apache License, Version 2.0 (the "License");
    # you may not use this file except in compliance with the License.
    # You may obtain a copy of the License at
    # http://www.apache.org/licenses/LICENSE-2.0
    # Unless required by applicable law or agreed to in writing, software
    # distributed under the License is distributed on an "AS IS" BASIS,
    # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    # See the License for the specific language governing permissions and
    # limitations under the License.
# ----------------------------------------------------------------------------------



<#
. Parameter
    "The source path to Specifies the path to the scripts or module to be analyzed"
#>

#Requires -Modules PSScriptAnalyzer
[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [string]$SrcPath = "../azure-docs-powershell/azps-7.3.0",
    [Parameter(Mandatory=$false)]
    [string]$DefaultCachePath = "$PSScriptRoot/Scripts",
    [Parameter(Mandatory=$false)]
    [string]$RulePath = "$PSScriptRoot/AnalyzeRules",
    [Parameter(Mandatory = $false)]
    [string]$DestPath = "$PSScriptRoot/Results",
    [switch]$UseCachedScripts,
    [string]$CachedScriptPath = "$PSScriptRoot/CachedScripts",
    [switch]$CleanCache
)

. "$PSScriptRoot/utils.ps1"

# Get scripts
if($UseCachedScripts.IsPresent){
    # Use cached scripts
    $scripts = Get-ChildItem -Path "$CachedScriptPath" -Recurse -Include *.ps1
}else{
    # Extract examples from markdown file
    $scripts = Extract-ScriptFromMarkdown -MarkdownPath $SrcPath -OutputPath $DefaultCachePath
}

# Get rules
if((Get-Item $RulePath) -is [System.IO.DirectoryInfo]){
    $rules = Get-ChildItem -Path "$RulePath" -Recurse -Include *.psm1
}else{
    $rules = $RulePath
}

# Create output file
if((Get-Item $DestPath) -is [System.IO.DirectoryInfo]){
    $null = New-Item -ItemType Directory -Force -Path $DestPath
    $null = New-Item -ItemType File -Force -Path $DestPath -Name "result.csv"
}else
{
    $null = New-Item -ItemType File -Force -Path $DestPath
}

$resultsTable = @()

# Analyze scripts
foreach($script in $scripts)
{
    Write-Debug "Analyzing $script"
    $diagnosticRecords = Invoke-ScriptAnalyzer -Path $script -CustomRulePath $rules # -IncludeDefaultRules

    if(![System.String]::IsNullOrEmpty($diagnosticRecords)){
        $result = Filter-Result $diagnosticRecords 
        $resultsTable += $result
        $result | Export-Csv "$DestPath\result.csv" -Force -Encoding UTF8 -Append
    }
}

# Clean caches
if($CleanCache.IsPresent){
    $scripts = Get-Item -Path "$DefaultCachePath" -Recurse -Include *.ps1 -File
    $scripts | Remove-Item -Force 
}

Write-Debug "Finished Analysis"

# $resultsTable | Group-Object -Property ViolationCategory -NoElement | Sort-Object -Property Count -Descending | ft -AutoSize

return  $resultsTable