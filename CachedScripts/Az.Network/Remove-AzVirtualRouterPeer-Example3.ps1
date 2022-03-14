
$virtualRouterPeer = Get-AzVirtualRouterPeer -ResourceGroupName virtualRouter -RouterName virtualRouter -PeerName csr

Remove-AzVirtualRouterPeer -InputObject $virtualRouterPeer
