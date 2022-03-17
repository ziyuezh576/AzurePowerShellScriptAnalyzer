
$peering = Get-AzPeering -ResourceGroupName $resourceGroupName -Name $name

$peering | New-AzPeeringRegisteredAsn -Name $asnName -Asn $asn
