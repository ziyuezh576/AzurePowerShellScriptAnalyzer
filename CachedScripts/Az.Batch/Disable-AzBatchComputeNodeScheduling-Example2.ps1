
$Context = Get-AzBatchAccountKey -AccountName "contosobatchaccount"

Get-AzBatchComputeNode -PoolId "Pool06"  -BatchContext $Context | Disable-AzBatchComputeNodeScheduling -BatchContext $Context
