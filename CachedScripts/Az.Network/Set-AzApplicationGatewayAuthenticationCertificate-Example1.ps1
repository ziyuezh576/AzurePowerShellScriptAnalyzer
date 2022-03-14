
$appgw = Get-AzApplicationGateway -ResourceGroupName "rg" -Name "appGwName"

$appgw = Set-AzApplicationGatewayAuthenticationCertificate -ApplicationGateway $appgw -Name "cert01" -CertificateFile "C:\cert2.cer"

$appgw = Set-AzApplicationGateway -ApplicationGateway $appgw
