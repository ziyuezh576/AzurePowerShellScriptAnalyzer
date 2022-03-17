
$vmss = Get-AzVmss -ResourceGroupName $RGName -VMScaleSetName $vmssName 

Remove-AzVmssExtension -VirtualMachineScaleSet $vmss -Name $vmssExtensionName

Update-AzVmss -ResourceGroupName $RGName -Name $vmssName -VirtualMachineScaleSet $vmss
