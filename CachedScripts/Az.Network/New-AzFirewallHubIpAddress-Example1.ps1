
$fwpips = New-AzFirewallHubPublicIpAddress -Count 2

New-AzFirewallHubIpAddress -PublicIPs $fwpips
