
$virtualRouterPeer = Get-AzVirtualRouterPeer -ResourceGroupName $resourceGroupName -VirtualRouterName $virtualRouterName -PeerName $peerName

Get-AzVirtualRouterPeerLearnedRouter -InputObject $virtualRouterPeer
