
$gw = Get-AzApplicationGateway -Name $appgwName -ResourceGroupName $resgpName

$autoscaleConfiguration = Get-AzApplicationGatewayAutoscaleConfiguration -ApplicationGateway $gw

$autoscaleConfiguration.MinCapacity
