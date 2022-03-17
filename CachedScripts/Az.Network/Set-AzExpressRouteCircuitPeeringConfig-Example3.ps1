
Set-AzExpressRouteCircuitPeeringConfig -ExpressRouteCircuit <PSExpressRouteCircuit> -MicrosoftConfigAdvertisedPublicPrefixes <String[]> -MicrosoftConfigCustomerAsn <Int32> -MicrosoftConfigRoutingRegistryName <String> -Name 'cert01' -PeerASN 100 -PeerAddressType IPv4 -PeeringType AzurePrivatePeering -PrimaryPeerAddressPrefix '123.0.0.0/30' -SecondaryPeerAddressPrefix '123.0.0.4/30' -VlanId 300
