
$autoscaleConfig = New-AzApplicationGatewayAutoscaleConfiguration -MinCapacity 3

$gw = New-AzApplicationGateway -Name $appgwName -ResourceGroupName $rgname ..  -AutoscaleConfiguration $autoscaleConfig
