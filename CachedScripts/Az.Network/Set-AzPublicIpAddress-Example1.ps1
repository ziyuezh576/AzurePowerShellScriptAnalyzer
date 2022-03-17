
$publicIp = Get-AzPublicIpAddress -Name $publicIpName -ResourceGroupName $rgName

$publicIp.PublicIpAllocationMethod = "Static"

Set-AzPublicIpAddress -PublicIpAddress $publicIp

Get-AzPublicIpAddress -Name $publicIpName -ResourceGroupName $rgName
