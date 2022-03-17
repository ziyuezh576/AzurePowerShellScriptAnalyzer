
$publicIp = Get-AzPublicIpAddress -Name $publicIpName -ResourceGroupName $rgName

$publicIp.DnsSettings.DomainNameLabel = "newdnsprefix"

Set-AzPublicIpAddress -PublicIpAddress $publicIp

$publicIp = Get-AzPublicIpAddress -Name $publicIpName -ResourceGroupName $rgName
