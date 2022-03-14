
$slb = Get-AzLoadBalancer -Name "MyLoadBalancer" -ResourceGroupName "MyResourceGroup"

Get-AzLoadBalancerProbeConfig -Name "MyProbe" -LoadBalancer $slb
