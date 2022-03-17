
$vmss = Get-AzVmss -ResourceGroupName $RGName -VMScaleSetName $vmssName 

Remove-AzVmssExtension -ResourceGroupName "Group002" -VirtualMachineScaleSet $vmss -Id $extensionId
