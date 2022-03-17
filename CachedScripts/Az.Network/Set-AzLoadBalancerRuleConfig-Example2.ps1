
$slb = Get-AzLoadBalancer -Name "MyLoadBalancer" -ResourceGroupName "MyResourceGroup"

$MyBackendPool1 = Get-AzLoadBalancerBackendAddressPool -ResourceGroupName $resourceGroup -LoadBalancerName $MyLoadBalancer -Name $backendPool1Name

$MyBackendPool2 = Get-AzLoadBalancerBackendAddressPool -ResourceGroupName $resourceGroup -LoadBalancerName $MyLoadBalancer -Name $backendPool2Name

$slb | Set-AzLoadBalancerRuleConfig -Name "NewRule" -FrontendIPConfiguration $slb.FrontendIpConfigurations[0] -Protocol "All" -FrontendPort 0 -BackendPort 0 -BackendAddressPool $MyBackendPool1, $MyBackendPool2

$slb | Set-AzLoadBalancer
