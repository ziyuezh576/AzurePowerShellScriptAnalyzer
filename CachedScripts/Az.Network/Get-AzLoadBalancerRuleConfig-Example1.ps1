
$slb = Get-AzLoadBalancer -Name "MyLoadBalancer" -ResourceGroupName "MyResourceGroup"

Get-AzLoadBalancerRuleConfig -Name "MyLBrulename" -LoadBalancer $slb
