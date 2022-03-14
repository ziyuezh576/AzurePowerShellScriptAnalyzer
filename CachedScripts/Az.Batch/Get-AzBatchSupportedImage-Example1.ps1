
$Context = Get-AzBatchAccountKey -AccountName "ContosoBatchAccount"

Get-AzBatchSupportedImage -BatchContext $Context
