
$Schedule = New-Object -TypeName "Microsoft.Azure.Commands.Batch.Models.PSSchedule"

$Schedule.RecurrenceInterval = [TimeSpan]::FromDays(1)

$JobSpecification = New-Object -TypeName "Microsoft.Azure.Commands.Batch.Models.PSJobSpecification"

$JobSpecification.PoolInformation = New-Object -TypeName "Microsoft.Azure.Commands.Batch.Models.PSPoolInformation"

$JobSpecification.PoolInformation.PoolId = "ContosoPool06"

New-AzBatchJobSchedule -Id "JobSchedule17" -Schedule $Schedule -JobSpecification $JobSpecification -BatchContext $Context
