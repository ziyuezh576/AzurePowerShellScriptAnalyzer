
$slb1 = Get-AzLoadBalancer -Name "MyLoadBalancer1" -ResourceGroupName "MyResourceGroup"

$feip = $Get-AzLoadBalancerFrontendIpConfig -Name "MyFrontEnd" -LoadBalancer $slb1

$slb2 = Get-AzLoadBalancer -Name "MyLoadBalancer1" -ResourceGroupName "MyResourceGroup"

$slb2 | Set-AzLoadBalancerFrontendIpConfig -Name "NewFrontend" -PublicIpAddress $publicIp -GatewayLoadBalancerId $feip.Id

$slb2 | Set-AzLoadBalancer
