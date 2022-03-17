
$Pool = Get-AzBatchPool "ContosoPool" -BatchContext $Context

$StartTask = New-Object Microsoft.Azure.Commands.Batch.Models.PSStartTask

$StartTask.CommandLine = "cmd /c echo example"

$Pool.StartTask = $StartTask

Set-AzBatchPool -Pool $Pool -BatchContext $Context
