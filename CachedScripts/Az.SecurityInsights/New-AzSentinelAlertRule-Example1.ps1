
$AlertRuleTemplateName = "f71aba3d-28fb-450b-b192-4e76a83015c8"

$AlertRule = New-AzSentinelAlertRule -ResourceGroupName "MyResourceGroup" -WorkspaceName "MyWorkspaceName" -Fusion -Enabled -AlertRuleTemplateName $AlertRuleTemplateName
