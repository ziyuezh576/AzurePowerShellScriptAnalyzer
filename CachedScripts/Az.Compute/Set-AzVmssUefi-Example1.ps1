
$VMSS = Get-AzVmss -ResourceGroupName "ResourceGroup11" -VMScaleSetName "ContosoVM07"

Set-AzVmssUefi -VirtualMachineScaleSet $VMSS -EnableVtpm $true -EnableSecureBoot $true
