
Add-AzLoadBalancerInboundNatPoolConfig -BackendPort 1001 -FrontendIpConfigurationId <String> -FrontendPortRangeEnd 2000 -FrontendPortRangeStart 1001 -Name 'myInboundNatPool' -Protocol TCP -LoadBalancer <PSLoadBalancer>
