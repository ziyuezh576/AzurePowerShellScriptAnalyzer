
$inputObject = Get-AzDnsForwardingRulesetVirtualNetworkLink -DnsResolverName pstestdnsresolvername -Name samplevnetLink1 -ResourceGroupName powershell-test-rg

Remove-AzDnsForwardingRulesetVirtualNetworkLink -InputObject $inputObject 
