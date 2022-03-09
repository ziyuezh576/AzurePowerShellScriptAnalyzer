$ResultsTable = Import-Csv -Path C:\Users\v-ziyzhe\Desktop\PSSA.csv
$ResultsTable = $ResultsTable | where {
    $_.RuleName.StartsWith("a\")
}
$ResultsTable = $ResultsTable | Select-Object *,@{Name='CommandName';Expression={$_.ScriptName.Split(".")[0]}}
$ResultsTable = $ResultsTable | Select-Object *,@{Name='Module';Expression={(Get-Command $_.CommandName -ErrorAction SilentlyContinue).Source}}
$ResultsTable | Export-Csv Desktop\PSSA2.csv -NoTypeInformation

Get-ChildItem -Directory newps | foreach {
    $Module = $_.Name
    $ResultsTable = @()
    Get-ChildItem $_\*.ps1 | foreach {
        Write-Output $_
        $Results = Invoke-ScriptAnalyzer -Path $_ -CustomRulePath Desktop\Measure-Examples.psm1
        $Results = $Results | Select-Object -Property @{Name='Cmdlet';Expression={$_.ScriptName.Split(".")[0]}}, *
        $Results = $Results | Select-Object -Property @{Name='Module';Expression={$Module}}, *
        $ResultsTable += $Results
    }
    $ResultsTable | Export-Csv newps\$Module.csv -NoTypeInformation
}
$Results = @()
dir newps -Filter *.csv | foreach {$Results += Import-Csv -Path $_.FullName}
$Results | Export-Csv PSSA3.csv -NoTypeInformation

$ResultsTable = @()
Get-ChildItem -Directory newps-1 | foreach {
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
$ResultsTable | Export-Csv newps-1\newps-1.csv -NoTypeInformation
