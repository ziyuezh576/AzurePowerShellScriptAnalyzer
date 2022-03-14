
$disk = Get-AzDisk -ResourceGroupName $rgname -DiskName $diskname0

$VmssVM = Get-AzVmssVM -ResourceGroupName "myrg" -VMScaleSetName "myvmss" -InstanceId 0

$VmssVM = Add-AzVMDataDisk -VirtualMachineScaleSetVM $VmssVM -Lun 0 -DiskSizeInGB 10 -CreateOption Attach -StorageAccountType Standard_LRS -ManagedDiskId $disk.Id

Update-AzVmssVM -VirtualMachineScaleSetVM $VmssVM
