
$extToUpdate = Get-AzConnectedMachineExtension -ResourceGroupName connectedMachines -MachineName linux-eastus1_1 -Name customScript

$extToUpdate | Update-AzConnectedMachineExtension -Settings @{
