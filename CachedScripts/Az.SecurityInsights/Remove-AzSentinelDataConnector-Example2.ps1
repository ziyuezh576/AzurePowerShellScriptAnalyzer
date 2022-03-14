
$SentinelConnection = @{

$DataConnector = Get-AzSentinelDataConnector @SentinelConnection | Where-Object {$_.Kind -eq "Office365"} 

Remove-AzSentinelDataConnector @SentinelConnection -DataConnectorId $DataConnector.Name
