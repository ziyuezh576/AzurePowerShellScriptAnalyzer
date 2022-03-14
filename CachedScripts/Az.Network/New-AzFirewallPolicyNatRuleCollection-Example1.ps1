
$netRule1 = New-AzFirewallPolicyNatRule -Name NatRule1 -Protocol "TCP" -SourceAddress "192.168.0.0/16" -DestinationAddress 10.20.30.40 -DestinationPort 1000 -TranslatedAddress "192.168.0.1" -TranslatedPort "100"

New-AzFirewallPolicyNatRuleCollection -Name NatRC1 -Priority 200 -Rule $netRule1 -ActionType "Dnat"
