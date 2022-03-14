
$vmss = Get-AzVmss -ResourceGroupName $rgname -VMScaleSetName $vmssName

Repair-AzVmssServiceFabricUpdateDomain -VirtualMachineScaleSet $vmss -PlatformUpdateDomain 1
