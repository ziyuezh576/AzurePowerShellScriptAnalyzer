
$VirtualMachine = Get-AzVM -ResourceGroupName "ResourceGroup11" -Name "VirtualMachine07" 

Remove-AzVMDataDisk -VM $VirtualMachine -Name "Disk3"

Update-AzVM -ResourceGroupName "ResourceGroup11" -VM $VirtualMachine
