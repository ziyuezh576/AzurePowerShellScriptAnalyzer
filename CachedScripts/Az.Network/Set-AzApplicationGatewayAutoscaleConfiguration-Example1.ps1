
$gw = Get-AzApplicationGateway -Name $appgwName -ResourceGroupName $resgpName

$gw = Set-AzApplicationGatewayAutoscaleConfiguration -ApplicationGateway $gw -MinCapacity 5

$gw = Set-AzApplicationGateway -ApplicationGateway $gw
