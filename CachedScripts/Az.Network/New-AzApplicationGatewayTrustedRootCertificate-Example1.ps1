
$certFilePath = ".\rootCA.cer"

$trc = New-AzApplicationGatewayTrustedRootCertificate -Name "trc1" -CertificateFile $certFilePath
