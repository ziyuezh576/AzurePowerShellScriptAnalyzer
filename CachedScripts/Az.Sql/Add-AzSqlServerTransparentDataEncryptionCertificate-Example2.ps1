
$privateBlob = "MIIJ+QIBAzCCCbUGCSqGSIb3DQEHAaCCCaYEggmiMIIJnjCCBhcGCSqGSIb3Dasdsadasd"

$securePrivateBlob = $privateBlob  | ConvertTo-SecureString -AsPlainText -Force

$password = "CertificatePassword"

$securePassword = $password | ConvertTo-SecureString -AsPlainText -Force

$server = Get-AzSqlServer -ServerName "YourServerName" -ResourceGroupName "YourResourceGroupName" 

Add-AzSqlServerTransparentDataEncryptionCertificate -SqlServerResourceId $server.ResourceId -PrivateBlob $securePrivateBlob -Password $securePassword
