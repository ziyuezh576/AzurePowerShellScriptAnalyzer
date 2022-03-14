
Get-AzSentinelIncident @SentinelConnection | Where-Object {$_.Title -eq "Failed AzureAD logons but success logon to host"}
