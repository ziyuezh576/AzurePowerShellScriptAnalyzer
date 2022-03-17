
$SentinelConnection = @{

$AlertRule = Get-AzSentinelAlertRule @SentinelConnection | Where-Object {$_.DisplayName -eq "My VIP has logged in"}

$AlertRuleAction = Get-AzSentinelAlertRuleAction @SentinelConnection -AlertRuleId $AlertRule.Name

Remove-AzSentinelAlertRuleAction @SentinelConnection -AlertRuleId $AlertRule.Name -ActionId $AlertRuleAction.Name
