
$asn = Get-AzPeerAsn -PeerName Contoso

$location = Get-AzPeeringLocation Direct -PeeringLocation Seattle

New-AzPeering -Name ContosoSeattlePeering -ResourceGroupName testCarrier -PeeringLocation $location.PeeringLocation -PeerAsnResourceId $asn.Id -DirectConnection $connection
