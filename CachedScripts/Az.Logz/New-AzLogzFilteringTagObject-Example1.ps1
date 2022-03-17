
$filter = New-AzLogzFilteringTagObject -Action 'Include' -Name 'Env' -Value "Prod"

New-AzLogzMonitorTagRule -ResourceGroupName logz-rg-test -MonitorName pwsh-logz04 -LogRuleFilteringTag $filter
