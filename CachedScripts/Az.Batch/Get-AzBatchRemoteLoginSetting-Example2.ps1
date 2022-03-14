
$Context = Get-AzBatchAccountKey -AccountName "ContosoBatchAccount"

Get-AzBatchRemoteLoginSetting -PoolId "ContosoPool" -ComputeNodeId "tvm-1900272697_1-20150330t205553z" -BatchContext $Context
