
$appgw = Get-AzApplicationGateway -ResourceGroupName "rg" -Name "appGwName"

$appgw = Set-AzApplicationGatewayUrlPathMapConfig -ApplicationGateway $appgw -Name "map01"

$appgw = Set-AzApplicationGateway -ApplicationGateway $appgw
