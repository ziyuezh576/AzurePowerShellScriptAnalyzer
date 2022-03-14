
Set-AzLoadBalancerProbeConfig -IntervalInSeconds 15 -Name 'NewProbe' -Port 443 -ProbeCount 2 -Protocol https -LoadBalancer <PSLoadBalancer>
