
$routerServerPeer = Get-AzRouteServerPeer -ResourceGroupName $resourceGroupName -RouteServerName $routeServerName -PeerName $peerName

Get-AzRouteServerPeerLearnedRouter -InputObject $routerServerPeer
