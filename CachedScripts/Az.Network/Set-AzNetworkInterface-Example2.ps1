
$nic = Get-AzNetworkInterface -ResourceGroupName "ResourceGroup1" -Name "NetworkInterface1"

$nic.DnsSettings.DnsServers.Add("192.168.1.100")

$nic | Set-AzNetworkInterface
