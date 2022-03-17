
New-AzDnsResolverOutboundEndpoint -DnsResolverName sampleResolver -Name sampleOutboundEndpoint -ResourceGroupName sampleRG -SubscriptionId ea40042d-63d8-4d02-9261-fb31450e6c67 -SubnetId "/subscriptions/0e5a46b1-de0b-4ec3-a5d7-dda908b4e076/resourceGroups/powershell-test-08b4e076/resourceGroups/sampleRG/providers/Microsoft.Network/virtualNetworks/psvirtualnetworkname16y71mjc/subnets/test-subnet" -Location westus2

New-AzDnsForwardingRuleset -Name dnsForwardingRuleset -ResourceGroupName sampleRG -Location westus2 -DnsResolverOutboundEndpoint  @{id = "/subscriptions/ea40042d-63d8-4d02-9261-fb31450e6c64/resourceGroups/sampleRG/providers/Microsoft.Network/dnsResolvers/sampleResolver/outboundEndpoints/sampleOutboundEndpoint";}
