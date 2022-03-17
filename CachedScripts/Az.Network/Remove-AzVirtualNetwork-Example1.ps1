
New-AzResourceGroup -Name TestResourceGroup -Location centralus

    $frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name frontendSubnet 

    $backendSubnet = New-AzVirtualNetworkSubnetConfig -Name backendSubnet -AddressPrefix 

New-AzVirtualNetwork -Name MyVirtualNetwork -ResourceGroupName TestResourceGroup 

Remove-AzVirtualNetwork -Name MyVirtualNetwork -ResourceGroupName TestResourceGroup
