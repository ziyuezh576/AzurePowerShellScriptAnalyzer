
$appgw = Get-AzApplicationGateway -ResourceGroupName "rg" -Name "appGwName"

$appgw = Remove-AzApplicationGatewayAuthenticationCertificate -ApplicationGateway $appgw -Name "cert01"

$appgw = Set-AzApplicationGateway -ApplicationGateway $appgw
