
$azFw=Get-AzFirewall -Name "azFw" -ResourceGroupName "rgName"

$netRule = New-AzFirewallNetworkRule -Name "all-udp-traffic" -Description "Rule for all UDP traffic" -Protocol "UDP" -SourceAddress "*" -DestinationAddress "*" -DestinationPort "*"

$netRuleCollection = New-AzFirewallNetworkRuleCollection -Name "MyNetworkRuleCollection" -Priority 100 -Rule $netRule -ActionType "Allow"

$azFw.AddNetworkRuleCollection($netRuleCollection)
