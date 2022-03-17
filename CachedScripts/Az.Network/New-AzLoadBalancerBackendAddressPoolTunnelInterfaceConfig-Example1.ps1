
$lb = Get-AzLoadBalancer -ResourceGroupName $resourceGroup -Name $loadBalancerName

$pool = Set-AzLoadBalancerBackendAddressPool -Name "BackendAddressPool02" -TunnelInterface $tunnelInterface1, $tunnelInterface2
