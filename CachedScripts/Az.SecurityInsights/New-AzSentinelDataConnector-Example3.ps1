
$SentinelConnection = @{

New-AzSentinelDataConnector @SentinelConnection -Office365 -Exchange Enabled -SharePoint Enabled -Teams Enabled
