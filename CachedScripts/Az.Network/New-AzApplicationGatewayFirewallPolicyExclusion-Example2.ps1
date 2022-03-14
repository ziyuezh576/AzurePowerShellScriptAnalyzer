
$exclusionEntry = New-AzApplicationGatewayFirewallPolicyExclusion -MatchVariable "RequestHeaderKeys" -SelectorMatchOperator "Contains" -Selector "abc"
