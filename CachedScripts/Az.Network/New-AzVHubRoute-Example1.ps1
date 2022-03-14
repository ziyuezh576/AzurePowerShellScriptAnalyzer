
$rgName = "testRg"

$firewallName = "testFirewall"

$firewall = Get-AzFirewall -Name $firewallName -ResourceGroupName $rgName

New-AzVHubRoute -Name "private-traffic" -Destination @("10.30.0.0/16", "10.40.0.0/16") -DestinationType "CIDR" -NextHop $firewall.Id -NextHopType "ResourceId"
