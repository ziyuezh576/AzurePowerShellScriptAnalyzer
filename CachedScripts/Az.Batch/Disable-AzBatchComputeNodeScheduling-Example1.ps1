
$Context = Get-AzBatchAccountKey -AccountName "contosobatchaccount"

Disable-AzBatchComputeNodeScheduling -PoolId "myPool" -Id "tvm-1783593343_34-20151117t222514z" -BatchContext $Context
