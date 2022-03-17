
$ingressnatrule = get-azVirtualNetworkGatewayNatRule -ResourceGroupName $RG1 -Name "natRule1" -ParentResourceName vnetgw1

$egressnatrule = get-azVirtualNetworkGatewayNatRule -ResourceGroupName $RG1 -Name "natRule2" -ParentResourceName vnetgw1

New-AzVirtualNetworkGatewayConnection -Name conn-client-1 -ResourceGroupName $RG1 -VirtualNetworkGateway1 $vnetgw1 -VirtualNetworkGateway2 $vnetgw2 -Location $loc1 -ConnectionType Vnet2Vnet -SharedKey 'a1b2c3d4e5' 
