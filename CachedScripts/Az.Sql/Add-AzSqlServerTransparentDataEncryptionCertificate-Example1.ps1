
$privateBlob = "MIIJ+QIBAzCCCbUGCSqGSIb3DQEHAaCCCaYEggmiMIIJnjCCBhcGCSqGSIb3Dasdsadasd"

$securePrivateBlob = $privateBlob  | ConvertTo-SecureString -AsPlainText -Force

$password = "CertificatePassword"

$securePassword = $password | ConvertTo-SecureString -AsPlainText -Force

Add-AzSqlServerTransparentDataEncryptionCertificate -ResourceGroupName "YourResourceGroupName" -ServerName "YourServerName" -PrivateBlob $securePrivateBlob -Password $securePassword
