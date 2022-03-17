
$dnsResolverDnsForwardingRulesetObject = Get-AzDnsForwardingRuleset -Name dnsForwardingRuleset -ResourceGroupName sampleRG

Remove-AzDnsForwardingRuleset -InputObject $dnsResolverDnsForwardingRulesetObject 
