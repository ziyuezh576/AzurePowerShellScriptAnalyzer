
$hubVnetConnection = Get-AzVirtualHubVnetConnection -ResourceGroupName "testRG" -VirtualHubName "testHub" -Name "testVnetConnection"

Get-AzVirtualHub -ResourceGroupName "testRG" -Name "testHub" | New-AzVirtualHubBgpConnection -PeerIp 192.168.1.5 -PeerAsn 20000 -Name "testBgpConnection" -VirtualHubVnetConnection $hubVnetConnection
