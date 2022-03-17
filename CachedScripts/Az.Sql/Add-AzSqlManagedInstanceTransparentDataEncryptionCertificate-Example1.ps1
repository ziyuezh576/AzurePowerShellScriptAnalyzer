
$privateBlob = "MIIJ+QIBAzCCCbUGCSqGSIb3DQEHAaCCCaYEggmiMIIJnjCCBhcGCSqGSIb3Dasdsadasd"

$securePrivateBlob = $privateBlob  | ConvertTo-SecureString -AsPlainText -Force

$password = "CertificatePassword"

$securePassword = $password | ConvertTo-SecureString -AsPlainText -Force

Add-AzSqlManagedInstanceTransparentDataEncryptionCertificate -ResourceGroupName "YourResourceGroupName" -ManagedInstanceName "YourManagedInstanceName" -PrivateBlob $securePrivateBlob -Password $securePassword
