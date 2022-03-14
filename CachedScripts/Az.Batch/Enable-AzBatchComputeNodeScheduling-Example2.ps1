
$Context = Get-AzBatchAccountKey -AccountName "contosobatchaccount"

Get-AzBatchComputeNode -PoolId "Pool06"  -BatchContext $Context | Enable-AzBatchComputeNodeScheduling  -BatchContext $Context
