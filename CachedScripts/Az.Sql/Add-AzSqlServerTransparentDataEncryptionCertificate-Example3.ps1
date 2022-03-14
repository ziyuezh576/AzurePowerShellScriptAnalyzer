
$privateBlob = "MIIJ+QIBAzCCCbUGCSqGSIb3DQEHAaCCCaYEggmiMIIJnjCCBhcGCSqGSIb3Dasdsadasd"

$securePrivateBlob = $privateBlob  | ConvertTo-SecureString -AsPlainText -Force

$password = "CertificatePassword"

$securePassword = $password | ConvertTo-SecureString -AsPlainText -Force

Get-AzSqlServer | Add-AzSqlServerTransparentDataEncryptionCertificate -ResourceGroupName "YourResourceGroupName" -PrivateBlob $securePrivateBlob -Password $securePassword
