
$dnsServers = @("10.10.10.1", "20.20.20.2")

New-AzFirewallPolicyDnsSetting -EnableProxy -Server $dnsServers
