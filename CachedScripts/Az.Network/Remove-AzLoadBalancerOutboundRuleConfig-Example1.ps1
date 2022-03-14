
$slb = Get-AzLoadBalancer -ResourceGroupName "MyResourceGroup" -Name "MyLoadBalancer"

Remove-AzLoadBalancerOutboundRuleConfig -Name "RuleName" -LoadBalancer $slb

Set-AzLoadBalancer -LoadBalancer $slb
