
Get-AzBatchPoolNodeCount -BatchContext $batchContext -PoolId "contosopool1"

$poolnodecounts = Get-AzBatchPoolNodeCount -BatchContext $batchContext -PoolId "contosopool1"

$poolnodecounts.Dedicated

Get-AzBatchPool -Id "contosopool1" -BatchContext $batchContext | Get-AzBatchPoolNodeCount -BatchContext $batchContext
