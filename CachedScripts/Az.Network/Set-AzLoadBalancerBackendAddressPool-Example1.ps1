
$virtualNetwork = Get-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroup

$lb = Get-AzLoadBalancer -ResourceGroupName $resourceGroup -Name $loadBalancerName

$ip1 = New-AzLoadBalancerBackendAddressConfig -IpAddress "10.0.0.5" -Name "TestVNetRef" -VirtualNetworkId $virtualNetwork.Id

$ip2 = New-AzLoadBalancerBackendAddressConfig -IpAddress "10.0.0.6" -Name "TestVNetRef2" -VirtualNetworkId $virtualNetwork.Id

$ip3 = New-AzLoadBalancerBackendAddressConfig -IpAddress "10.0.0.7" -Name "TestVNetRef3" -VirtualNetworkId $virtualNetwork.id

$tunnelInterface1 = New-AzLoadBalancerBackendAddressPoolTunnelInterfaceConfig -Protocol "Vxlan" -Type "Internal" -Port 2000 -Identifier 800

$tunnelInterface2 = New-AzLoadBalancerBackendAddressPoolTunnelInterfaceConfig -Protocol "Vxlan" -Type "External" -Port 2001 -Identifier 801

New-AzLoadBalancerBackendAddressPool -ResourceGroupName $resourceGroup -LoadBalancerName $loadBalancerName -Name $backendPool3 -TunnelInterface $tunnelInterface1, $tunnelInterface2

$ips = @($ip1, $ip2)

$b2 = Get-AzLoadBalancerBackendAddressPool -ResourceGroupName $resourceGroup -LoadBalancerName $loadBalancerName -Name $backendPool1

$b2.LoadBalancerBackendAddresses.Add($ip3)

Set-AzLoadBalancerBackendAddressPool -InputObject $b2
