
$Stream = New-Object -TypeName "System.IO.MemoryStream"

Get-AzBatchNodeFileContent -JobId "Job03" -TaskId "Task11" -Path "StdOut.txt" -DestinationStream $Stream -BatchContext $Context
