
$appgw = Get-AzApplicationGateway -ResourceGroupName "rg" -Name "appGwName"

$appgw = Remove-AzApplicationGatewayUrlPathMapConfig -ApplicationGateway $appgw -Name "map01"

$appgw = Set-AzApplicationGateway -ApplicationGateway $appgw
