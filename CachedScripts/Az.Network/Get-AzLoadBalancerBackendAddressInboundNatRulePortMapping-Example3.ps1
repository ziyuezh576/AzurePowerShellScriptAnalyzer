
$slb = Get-AzLoadBalancer -Name "MyLoadBalancer" -ResourceGroupName "MyResourceGroup"

Get-AzLoadBalancerBackendAddressInboundNatRulePortMapping -LoadBalancer $slb -Name $backendAddressPoolName -IpAddress $testIpAddress1
