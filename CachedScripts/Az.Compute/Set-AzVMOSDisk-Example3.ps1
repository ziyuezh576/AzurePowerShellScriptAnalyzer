
$AvailabilitySet = Get-AzAvailabilitySet -ResourceGroupName "ResourceGroup11" -Name "AvailabilitySet13" 

$VirtualMachine = New-AzVMConfig -VMName "VirtualMachine17" -VMSize "Standard_A1"

$VirtualMachine = Set-AzVMOSDisk -VM $VirtualMachine -Name "osDisk.vhd" -VhdUri "https://mystorageaccount.blob.core.windows.net/disks/" -CreateOption Attach -Linux

New-AzVM -VM $VirtualMachine -ResourceGroupName "ResourceGroup11"
