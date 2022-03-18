Get-ChildItem -Directory .\ScriptsByExample | foreach {
    $Module = $_.Name
    $ResultsTable = @()
    Get-ChildItem $_\*.ps1 | foreach {
        Write-Output $_
        $Results = Invoke-ScriptAnalyzer -Path $_ -CustomRulePath Desktop\Measure-Examples.psm1
        $Results = $Results | Select-Object -Property @{Name='Cmdlet';Expression={$_.ScriptName.Split(".")[0]}}, *
        $Results = $Results | Select-Object -Property @{Name='Module';Expression={$Module}}, *
        $ResultsTable += $Results
    }
    $ResultsTable | Export-Csv .\ScriptsByExample\$Module.csv -NoTypeInformation
}
$Results = @()
dir .\ScriptsByExample -Filter *.csv | foreach {$Results += Import-Csv -Path $_.FullName}
$Results | Export-Csv PSSA.csv -NoTypeInformation


$ResultsTable = @()
Get-ChildItem -Directory .\ScriptsByExample | foreach {
    $Module = $_.Name
    Get-ChildItem $_\*.ps1 | foreach {
        $LastIndexOfDash = $_.BaseName.LastIndexOf("-")
        $Cmdlet = $_.BaseName.Substring(0, $LastIndexOfDash)
        $ExampleNumber = $_.BaseName.Substring($LastIndexOfDash + 1)
        Write-Output $_
        $CmdletNames = [System.Management.Automation.Language.Parser]::ParseFile($_,[ref]$null,[ref]$null).FindAll({$args[0] -is [System.Management.Automation.Language.Ast]}, $true) |
            where {$_ -is [System.Management.Automation.Language.CommandAst]} |
            foreach {$_.CommandElements[0].Extent.Text}
        if ($Cmdlet -notin $CmdletNames) {
            $ResultsTable += [PSCustomObject]@{
                Module = $Module;
                Cmdlet = $Cmdlet;
                ExampleNumber = $ExampleNumber
            }
        }
    }
}
$ResultsTable | Export-Csv .\AnalysisResultsTable.csv -NoTypeInformation
