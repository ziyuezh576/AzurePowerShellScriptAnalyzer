
$nic = Get-AzNetworkInterface -ResourceGroupName "ResourceGroup1" -Name "NetworkInterface1"

$nic.EnableIPForwarding = 1

$nic | Set-AzNetworkInterface
