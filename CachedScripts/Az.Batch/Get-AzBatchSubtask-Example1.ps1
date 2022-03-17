
$Context = Get-AzBatchAccountKey -AccountName "contosobatchaccount"

Get-AzBatchSubtask -JobId "Job-01" -TaskID "myTask" -BatchContext $Context
