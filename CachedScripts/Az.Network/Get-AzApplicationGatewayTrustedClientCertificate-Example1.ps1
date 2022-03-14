
$gw = Get-AzApplicationGateway -Name $appgwName -ResourceGroupName $resgpName

$trustedClientCert = Get-AzApplicationGatewayTrustedClientCertificate -ApplicationGateway $gw -Name $certName
