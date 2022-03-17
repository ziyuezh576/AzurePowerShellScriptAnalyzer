
$lb = Get-AzLoadBalancer -ResourceGroupName $resourceGroup -Name $loadBalancerName

$lb | Get-AzLoadBalancerBackendAddressPool
