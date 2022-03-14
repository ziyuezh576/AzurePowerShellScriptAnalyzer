
$Nic = Get-AzNetworkInterface -ResourceGroupName "ResourceGroup1" -Name "NetworkInterface1"

$Nic.IpConfigurations[0].PrivateIpAddress = "10.0.1.20"

$Nic.IpConfigurations[0].PrivateIpAllocationMethod = "Static"

$Nic.Tag = @{Name = "Name"; Value = "Value"}

Set-AzNetworkInterface -NetworkInterface $Nic
