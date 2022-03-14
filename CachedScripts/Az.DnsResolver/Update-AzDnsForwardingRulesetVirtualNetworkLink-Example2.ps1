
$inputObject = Get-AzDnsForwardingRulesetVirtualNetworkLink -DnsResolverName pstestdnsresolvername -Name samplevnetLink1 -ResourceGroupName powershell-test-rg

Update-AzDnsForwardingRulesetVirtualNetworkLink -InputObject $inputObject -Metadata @{"value0" = "value1"}
