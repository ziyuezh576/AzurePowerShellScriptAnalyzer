
$SentinelConnection = @{

$ruleToDisable = Get-AzSentinelAlertRule @SentinelConnection | Where-Object {$_.DisplayName -eq "Mimikatz Detected"}

Update-AzSentinelAlertRule @SentinelConnection -AlertRuleId $ruleToDisable.Name -Disabled
