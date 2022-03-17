
$gw = Get-AzApplicationGateway -Name $appgwName -ResourceGroupName $resgpName

$gw = Set-AzApplicationGatewayTrustedRootCertificate -ApplicationGateway $gw -Name $certName --CertificateFile ".\rootCAUpdated.cer"

$gw = Set-AzApplicationGateway -ApplicationGateway $gw
