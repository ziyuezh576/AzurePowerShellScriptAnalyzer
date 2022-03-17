
$Context = Get-AzBatchAccountKey -AccountName "ContosoBatchAccount"

$StartTime = Get-Date -Date "2016-05-16 00:00:00Z"

$EndTime = Get-Date -Date "2016-05-16 01:00:00Z"

Get-AzBatchPoolUsageMetric -StartTime $StartTime -EndTime $EndTime -BatchContext $context
