
$slb = Get-AzLoadBalancer -Name "MyLoadBalancer" -ResourceGroupName "MyResourceGroup"

$slb | Get-AzLoadBalancerInboundNatPoolConfig -Name myInboundNatPool
