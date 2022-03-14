
New-AzResourceGroup -Name "TestResourceGroup" -Location "Central US"

$virtualWan = New-AzVirtualWan -Name "MyVirtualWan" -ResourceGroupName "TestResourceGroup" -Location "Central US"

Remove-AzVirtualWan -InputObject $virtualWan -Passthru
