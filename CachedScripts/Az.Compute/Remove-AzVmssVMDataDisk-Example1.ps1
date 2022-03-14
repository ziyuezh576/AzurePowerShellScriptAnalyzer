
$VmssVM = Get-AzVmssVM -ResourceGroupName "myrg" -VMScaleSetName "myvmss" -InstanceId 0 

Remove-AzVmssVMDataDisk -VM $VirtualMachine -Lun 0

Update-AzVmssVM -VirtualMachineScaleSetVM $VmssVM
