
$virtualRouterPeer = Get-AzVirtualRouterPeer -ResourceGroupName $resourceGroupName -VirtualRouterName $virtualRouterName -PeerName $peerName

Get-AzVirtualRouterPeerAdvertisedRouter -InputObject $virtualRouterPeer
