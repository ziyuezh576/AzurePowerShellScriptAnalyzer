
Get-AzSentinelAlertRuleTemplate @SentinelConnection | Where-Object {$_.Kind -eq "Scheduled"}
