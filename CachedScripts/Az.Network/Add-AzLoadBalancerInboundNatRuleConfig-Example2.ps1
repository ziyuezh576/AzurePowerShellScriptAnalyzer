
$slb = Get-AzLoadBalancer -Name "MyLoadBalancer" -ResourceGroupName "MyResourceGroup"

$slb | Add-AzLoadBalancerInboundNatRuleConfig -Name "NewNatRuleV2" -FrontendIPConfiguration $slb.FrontendIpConfigurations[0] -Protocol "Tcp" -IdleTimeoutInMinutes 10 -FrontendPortRangeStart 3389 -FrontendPortRangeEnd 4000 -BackendAddressPool $slb.BackendAddressPools[0] -BackendPort 3389

$slb | Set-AzLoadBalancer
