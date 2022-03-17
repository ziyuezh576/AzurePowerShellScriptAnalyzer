
$VM = Get-AzVM -ResourceGroupName "ResourceGroup11" -VMName "ContosoVM07"

Set-AzVMUefi -VM $VM -EnableVtpm $true -EnableSecureBoot $true
