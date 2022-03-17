
$s1h1 = Get-AzVirtualNetworkPeering -Name 'spoke1-hub1' -VirtualNetworkName 'spoke1' -ResourceGroupName 'HUB1-RG'

$s1h1 | Sync-AzVirtualNetworkPeering
