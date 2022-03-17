
$Context = Get-AzBatchAccountKey -AccountName "ContosoBatchAccount"

Get-AzBatchComputeNode -PoolId "ContosoPool" -BatchContext $Context | Get-AzBatchRemoteLoginSetting -BatchContext $Context
