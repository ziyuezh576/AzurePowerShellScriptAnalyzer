
$routeServerPeer = Get-AzRouteServerPeer -ResourceGroupName routeServerRG -RouteServerName routeServer -PeerName peer

Remove-AzRouteServerPeer -InputObject $RouteServerPeer
