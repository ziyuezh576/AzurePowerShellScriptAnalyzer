
$slb = Get-AzLoadBalancer -Name "NRPLB"

$slb | Add-AzLoadBalancerInboundNatRuleConfig -Name "NewRule" -FrontendIpConfiguration $slb.FrontendIpConfigurations[0] -FrontendPort 81 -BackendPort 8181 -Protocol "TCP"

$slb | Set-AzLoadBalancer
