
$SentinelConnection = @{

$LogicAppConnection = @{

$LogicAppResourceId = Get-AzLogicApp @LogicAppConnection

$LogicAppTriggerUri = Get-AzLogicAppTriggerCallbackUrl @LogicAppConnection -TriggerName "When_a_response_to_an_Azure_Sentinel_alert_is_triggered"

$AnalyticsRule = Get-AzSentinelAlertRule @SentinelConnection | Where-Object {$PSItem.DisplayName -eq "Mimikatz Detected"}

$AlertRuleAction = New-AzSentinelAlertRuleAction @SentinelConnection -AlertRuleId $AnalyticsRule.Name -LogicAppResourceId ($LogicAppResourceId.Id) -TriggerUri ($LogicAppTriggerUri.Value)
