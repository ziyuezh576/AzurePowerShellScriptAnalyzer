
$vnet = Get-AzVirtualNetwork -ResourceGroupName rgName -Name anotherVNetName

$pip = Get-AzPublicIpAddress -ResourceGroupName rgName -Name publicIpName

$mgmtPip = Get-AzPublicIpAddress -ResourceGroupName rgName -Name MgmtPublicIpName

$firewall.Allocate($vnet, $pip, $mgmtPip)

$firewall | Set-AzFirewall
