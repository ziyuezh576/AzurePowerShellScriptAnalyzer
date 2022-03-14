
$VM = Get-AzVM -ResourceGroupName "ResourceGroup11" -VMName "ContosoVM07"

Set-AzVMDataDisk -VM $VM -Name "DataDisk01" -Caching ReadWrite | Update-AzVM
