
$inputObject = Get-AzDnsForwardingRuleset -ResourceGroupName powershell-test-rg -Name  dnsForwardingRuleset

Update-AzDnsForwardingRuleset -InputObject $inputObject  -Metadata @{"key0" = "value0"} 
