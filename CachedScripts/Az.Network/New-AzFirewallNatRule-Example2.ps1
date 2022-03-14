
New-AzFirewallNatRule -DestinationAddress '10.0.0.1' -DestinationPort '443' -Name 'dnat-rule' -Protocol Any -SourceIpGroup <String[]> -TranslatedAddress '10.0.0.2' -TranslatedPort '8080'
