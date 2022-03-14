
$ft = New-AzElasticFilteringTagObject -Action Include -Name key -Value '1'

New-AzElasticTagRule -ResourceGroupName azure-elastic-test -MonitorName elastic-pwsh02 -LogRuleFilteringTag $ft
