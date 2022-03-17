
$PublicIp = Get-AzPublicIpAddress -ResourceGroupName "myRG" -Name "MyPub"

Get-AzLoadBalancer -Name "MyLB" -ResourceGroupName "NrpTest" | Add-AzLoadBalancerFrontendIpConfig -Name "FrontendName" -PublicIpAddress $PublicIp | Set-AzLoadBalancer
