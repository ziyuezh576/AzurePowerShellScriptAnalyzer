
$Context = Get-AzBatchAccountKey -AccountName "ContosoBatchAccount"

$PoolStatistics = Get-AzBatchPoolStatistic -BatchContext $Context

$PoolStatistics.ResourceStatistics
