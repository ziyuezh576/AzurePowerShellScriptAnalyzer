
Get-AzLoadBalancerBackendAddressInboundNatRulePortMapping -ResourceGroupName $rgname -LoadBalancerName $lbName -NetworkInterfaceIpConfigurationId $ipconfig.Id -Name pool1
