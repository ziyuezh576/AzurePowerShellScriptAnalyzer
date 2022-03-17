
$peering = Get-AzPeering -ResourceGroupName rg1 -PeerName "ContosoPeering"  

$peering.Connections[0] = $peering.Connections[0] | Set-AzPeeringDirectConnectionObject -MD5AuthenticationKey $hash

$peering | Update-AzPeering
