
$conn = Get-AzVirtualNetworkGatewayConnection -Name 1 -ResourceGroupName myRG

$egressNatrule = get-azVirtualNetworkGatewayNatRule -ResourceGroupName myRG -Name "natRule1" -ParentResourceName "gw1"

Set-AzVirtualNetworkGatewayConnection -VirtualNetworkGatewayConnection $conn -IngressNatRule @() -EgressNatRule $egressNatrule
