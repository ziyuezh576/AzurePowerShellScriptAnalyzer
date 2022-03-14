
$vnet=Get-AzVirtualNetwork -Name "vnet" -ResourceGroupName "rgName"

$publicIp=Get-AzPublicIpAddress -Name "firewallpip" -ResourceGroupName "rgName"

$azFw=Get-AzFirewall -Name "azFw" -ResourceGroupName "rgName"

$azFw.Allocate($vnet, $publicIp)
