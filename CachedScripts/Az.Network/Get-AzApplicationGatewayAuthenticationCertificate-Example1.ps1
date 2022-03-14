
$appgw = Get-AzApplicationGateway -ResourceGroupName "rg" -Name "appGwName"

$cert = Get-AzApplicationGatewayAuthenticationCertificate -Name "cert01" -ApplicationGateway $appgw
