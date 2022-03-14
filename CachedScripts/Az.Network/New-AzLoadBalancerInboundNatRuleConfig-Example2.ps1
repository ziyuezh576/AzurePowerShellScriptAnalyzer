
$slb = Get-AzLoadBalancer -Name "MyLoadBalancer" -ResourceGroupName "MyResourceGroup"

$natRuleV2 = New-AzLoadBalancerInboundNatRuleConfig -Name natRuleV2 -Protocol "Tcp" -FrontendIpConfiguration $slb.FrontendIpConfigurations[0] -FrontendPortRangeStart 3390 -FrontendPortRangeEnd 4001 -BackendAddressPool $slb.BackendAddressPools[0] -IdleTimeoutInMinutes 4 -BackendPort 3389
