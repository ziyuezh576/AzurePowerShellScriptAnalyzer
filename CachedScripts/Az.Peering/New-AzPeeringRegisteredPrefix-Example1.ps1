
$peering = Get-AzPeering -ResourceGroupName $resourceGroupName -Name $name

$peering | New-AzPeeringRegisteredPrefix -Name $asnName -Asn $asn
