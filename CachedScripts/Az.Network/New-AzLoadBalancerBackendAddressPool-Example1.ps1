
$virtualNetwork = Get-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroup

$lb = Get-AzLoadBalancer -ResourceGroupName $resourceGroup -Name $loadBalancerName

$ip1 = New-AzLoadBalancerBackendAddressConfig -IpAddress "10.0.0.5" -Name "TestVNetRef" -VirtualNetworkId $virtualNetwork.Id

$ip2 = New-AzLoadBalancerBackendAddressConfig -IpAddress "10.0.0.6" -Name "TestVNetRef2" -VirtualNetworkId $virtualNetwork.Id

$ips = @($ip1, $ip2)

$lb | New-AzLoadBalancerBackendAddressPool -Name $backendPool1
