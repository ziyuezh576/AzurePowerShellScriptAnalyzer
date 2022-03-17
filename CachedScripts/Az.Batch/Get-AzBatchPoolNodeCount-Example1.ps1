
$batchContext = Get-AzBatchAccountKey -AccountName "contosobatch"

Get-AzBatchPoolNodeCount -BatchContext $batchContext
