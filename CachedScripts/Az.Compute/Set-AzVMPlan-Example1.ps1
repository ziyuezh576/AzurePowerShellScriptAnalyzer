
New-AzVMConfig -VMName "VirtualMachine07" -VMSize "Standard_B1s" |
    Set-AzVMPlan -Publisher "Canonical" -Product "UbuntuServer" -Name "18.04-LTS"
