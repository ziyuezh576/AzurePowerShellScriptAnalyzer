
$extToUpdate = Get-AzConnectedMachineExtension -ResourceGroupName connectedMachines -MachineName linux-eastus1_1 -Name customScript

$extToUpdate.Setting.commandToExecute = "ls -l"

$splat = @{

$extToUpdate | Update-AzConnectedMachineExtension @splat
