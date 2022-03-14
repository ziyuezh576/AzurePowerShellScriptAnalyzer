
$gw = Get-AzApplicationGateway -Name $appgwName -ResourceGroupName $resgpName

$trustedRootCert = Get-AzApplicationGatewayTrustedRootCertificate -ApplicationGateway $gw -Name $certName --CertificateFile ".\rootCA.cer"
