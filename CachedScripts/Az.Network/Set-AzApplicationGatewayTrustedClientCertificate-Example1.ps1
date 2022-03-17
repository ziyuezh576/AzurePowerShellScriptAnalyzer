
$gw = Get-AzApplicationGateway -Name $appgwName -ResourceGroupName $resgpName

$gw = Set-AzApplicationGatewayTrustedClientCertificate -ApplicationGateway $gw -Name $certName --CertificateFile ".\clientCAUpdated.cer"

$gw = Set-AzApplicationGateway -ApplicationGateway $gw
