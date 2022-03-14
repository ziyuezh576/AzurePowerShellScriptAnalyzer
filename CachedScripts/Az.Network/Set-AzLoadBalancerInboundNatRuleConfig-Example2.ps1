
Set-AzLoadBalancerInboundNatRuleConfig -BackendPort 3350 -FrontendIpConfigurationId <String> -FrontendPort 3350 -LoadBalancer <PSLoadBalancer> -Name 'NewNatRule' -Protocol 'Tcp'
