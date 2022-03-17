
$peering = Get-AzPeering -ResourceGroupName rg1  -PeerName "ContosoExchangePeering" 

$peering.Connections[0] = $peering.Connections[0] | Set-AzPeeringExchangeConnectionObject -PeerSessionIPv4Address $ipv4Address

Update-AzPeering -ResourceId $peering.Id $peering.Connections
