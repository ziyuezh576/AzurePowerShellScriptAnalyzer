
Get-AzSentinelDataConnector @SentinelConnection | Where-Object {$_.Kind -eq "Office365"}
