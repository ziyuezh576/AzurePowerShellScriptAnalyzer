
$Task = Get-AzBatchTask -JobId "Job16" -Id "Task22" -BatchContext $Context

$Constraints = New-Object Microsoft.Azure.Commands.Batch.Models.PSTaskConstraints -ArgumentList @([TimeSpan}::FromDays(5), [TimeSpan]::FromDays(2), 3)

$Task.Constraints = $Constraints

Set-AzBatchTask -Task $Task -BatchContext $Context
