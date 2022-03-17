
$inputobject = Get-AzDnsForwardingRulesetForwardingRule -DnsForwardingRulesetName DnsResolverName -ResourceGroupName sampleRG -Name forwardingRule

Remove-AzDnsForwardingRulesetForwardingRule -InputObject $inputObject
