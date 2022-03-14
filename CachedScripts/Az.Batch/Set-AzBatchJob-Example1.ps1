
$Job = Get-AzBatchJob -Id "Job17" -BatchContext $Context

$Job.Priority = 1

Set-AzBatchJob -Job $Job -BatchContext $Context
