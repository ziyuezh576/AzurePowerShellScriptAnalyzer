
$appgw = Get-AzApplicationGateway -ResourceGroupName "rg" -Name "appGwName"

$appgw = Add-AzApplicationGatewayAuthenticationCertificate -ApplicationGateway $appgw -Name "cert01" -CertificateFile "C:\cert.cer"

$appgw = Set-AzApplicationGateway -ApplicationGateway $appgw
