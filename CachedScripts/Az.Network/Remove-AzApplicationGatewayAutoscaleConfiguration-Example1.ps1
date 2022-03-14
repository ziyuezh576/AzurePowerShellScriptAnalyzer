
$gw = Get-AzApplicationGateway -Name $appgwName -ResourceGroupName $resgpName

$gw = Remove-AzApplicationGatewayAutoscaleConfiguration -ApplicationGateway $gw

$gw = Set-AzApplicationGateway -ApplicationGateway $gw
