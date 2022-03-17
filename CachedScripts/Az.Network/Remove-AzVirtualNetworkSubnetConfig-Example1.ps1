
New-AzResourceGroup -Name TestResourceGroup -Location centralus

    $frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name frontendSubnet 

$backendSubnet = New-AzVirtualNetworkSubnetConfig -Name backendSubnet -AddressPrefix 

$virtualNetwork = New-AzVirtualNetwork -Name MyVirtualNetwork -ResourceGroupName 

    $frontendSubnet,$backendSubnet

Remove-AzVirtualNetworkSubnetConfig -Name backendSubnet -VirtualNetwork 

    $virtualNetwork

    $virtualNetwork | Set-AzVirtualNetwork
