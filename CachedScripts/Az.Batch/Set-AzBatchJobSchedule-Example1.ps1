
$JobSchedule = Get-AzBatchJobSchedule -Id "MyJobSchedule" -BatchContext $Context

$JobSchedule.Schedule.RecurrenceInterval = New-TimeSpan -Days 2

Set-AzBatchJobSchedule -JobSchedule $Job -BatchContext $Context
