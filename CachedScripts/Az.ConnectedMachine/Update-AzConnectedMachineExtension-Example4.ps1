
$extToUpdate = Get-AzConnectedMachineExtension -ResourceGroupName connectedMachines -MachineName linux-eastus1_1 -Name customScript

$extToUpdate.Setting.commandToExecute = "ls -l"

$extToUpdate | Update-AzConnectedMachineExtension -ExtensionParameter $extToUpdate
