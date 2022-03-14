
$AlertRule = Get-AzSentinelAlertRule -ResourceGroupName "MyResourceGroup" -WorkspaceName "MyWorkspaceName" -AlertRuleId "MyAlertRuleId"

Update-AzSentinelAlertRule -InputObject $AlertRule -Disabled
