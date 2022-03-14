
$slb = Get-AzLoadBalancer -ResourceGroupName "MyResourceGroup" -Name "MyLoadBalancer"

Get-AzLoadBalancerOutboundRuleConfig -LoadBalancer $slb -Name "MyRule"
