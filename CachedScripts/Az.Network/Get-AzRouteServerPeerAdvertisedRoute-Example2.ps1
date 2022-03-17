
$routeServerPeer = Get-AzRouteServerPeer -ResourceGroupName $resourceGroupName -RouteServerName $routeServerName -PeerName $peerName

Get-AzRouteServerPeerAdvertisedRouter -InputObject $routeServerPeer
