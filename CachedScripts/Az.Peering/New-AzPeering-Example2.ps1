
$asn = Get-AzPeerAsn -PeerName Contoso

$location = Get-AzPeeringLocation Exchange -PeeringLocation Seattle

New-AzPeering -Name ContosoSeattlePeering -ResourceGroupName testCarrier -PeeringLocation $location.PeeringLocation -PeerAsnResourceId $asn.Id -ExchangeConnection $connection
