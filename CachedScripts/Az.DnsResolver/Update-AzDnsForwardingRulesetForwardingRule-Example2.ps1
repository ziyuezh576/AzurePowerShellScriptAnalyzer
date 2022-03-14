
$inputObject = Get-AzDnsForwardingRulesetForwardingRule -ResourceGroupName powershell-test-rg -DnsForwardingRulesetName dnsForwardingRuleset -Name sampleForwardingRule

Update-AzDnsForwardingRulesetForwardingRule -InputObject $inputObject  -Metadata @{"value0" = "value1"}
