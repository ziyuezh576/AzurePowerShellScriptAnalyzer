
$firewall=Get-AzFirewall -ResourceGroupName rgName -Name azFw

$firewall.Deallocate()

$firewall | Set-AzFirewall

$vnet = Get-AzVirtualNetwork -ResourceGroupName rgName -Name anotherVNetName

$pip = Get-AzPublicIpAddress -ResourceGroupName rgName -Name publicIpName

$firewall.Allocate($vnet, $pip)

$firewall | Set-AzFirewall
