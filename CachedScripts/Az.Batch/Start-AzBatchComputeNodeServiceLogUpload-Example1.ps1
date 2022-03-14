
$storageContext = New-AzStorageContext -StorageAccountName "contosogeneral" -StorageAccountKey "<Storage Key for ContosoGeneral ends with ==>"

$sasToken = New-AzStorageContainerSASToken -Name "contosocontainer" -Context $storageContext

$containerUrl = "https://contosogeneral.blob.core.windows.net/contosocontainer" + $sasToken

$batchContext = Get-AzBatchAccountKey -AccountName "contosobatch"

Start-AzBatchComputeNodeServiceLogUpload -BatchContext $batchContext -PoolId "contosopool" -ComputeNodeId "tvm-1612030122_1-20180405t234700z" -ContainerUrl $containerUrl -StartTime "2018-01-01 00:00:00Z"
