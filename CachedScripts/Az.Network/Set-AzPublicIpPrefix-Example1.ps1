
$publicIpPrefix = Get-AzPublicIpPrefix -Name $prefixName -ResourceGroupName $rgName

$publicIpPrefix.Tags = "TestTag"

Set-AzPublicIpPrefix -PublicIpPrefix $publicIpPrefix
