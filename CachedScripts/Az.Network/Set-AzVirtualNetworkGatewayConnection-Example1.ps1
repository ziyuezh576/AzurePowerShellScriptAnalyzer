
$conn = Get-AzVirtualNetworkGatewayConnection -Name 1 -ResourceGroupName myRG

Set-AzVirtualNetworkGatewayConnection -VirtualNetworkGatewayConnection $conn
