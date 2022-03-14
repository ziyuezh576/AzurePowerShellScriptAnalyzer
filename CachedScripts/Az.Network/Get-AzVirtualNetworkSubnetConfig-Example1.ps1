
New-AzResourceGroup -Name TestResourceGroup -Location centralus

    $frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name frontendSubnet 

    $virtualNetwork = New-AzVirtualNetwork -Name MyVirtualNetwork -ResourceGroupName 

    Get-AzVirtualNetworkSubnetConfig -Name frontendSubnet -VirtualNetwork $virtualNetwork
