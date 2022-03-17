
$password = ConvertTo-SecureString $passwordPlainString -AsPlainText -Force

$cert = New-AzApplicationGatewaySslCertificate -Name "Cert01" -CertificateFile "D:\cert01.pfx" -Password $password
