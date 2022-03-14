
New-AzLoadBalancerBackendAddressPool -ResourceGroupName $resourceGroup -LoadBalancerName $loadBalancerName -Name $backendPool3 -TunnelInterface $tunnelInterface1, $tunnelInterface2
