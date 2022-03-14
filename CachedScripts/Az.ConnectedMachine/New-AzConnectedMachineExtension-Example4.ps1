
$ext = Get-AzConnectedMachineExtension -Name custom -ResourceGroupName ContosoTest -MachineName other

$ext | New-AzConnectedMachineExtension -ExtensionParameter $ext
