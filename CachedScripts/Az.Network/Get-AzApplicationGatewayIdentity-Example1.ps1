
$gw = Get-AzApplicationGateway -Name $appgwName -ResourceGroupName $resgpName

$identity = Get-AzApplicationGatewayIdentity -ApplicationGateway $gw
