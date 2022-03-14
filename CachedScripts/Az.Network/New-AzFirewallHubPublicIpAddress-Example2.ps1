
$publicIp1 = New-AzFirewallPublicIpAddress -Address 10.2.3.4

$publicIp2 = New-AzFirewallPublicIpAddress -Address 20.56.37.46

New-AzFirewallHubPublicIpAddress -Count 3 -Addresses $publicIp1, $publicIp2
