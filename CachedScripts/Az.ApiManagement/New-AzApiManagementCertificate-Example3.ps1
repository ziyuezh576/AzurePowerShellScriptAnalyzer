
$secretIdentifier = 'https://contoso.vault.azure.net/secrets/xxxx'

$keyvault = New-AzApiManagementKeyVaultObject -SecretIdentifier $secretIdentifier 

$keyVaultcert = New-AzApiManagementCertificate -Context $context -CertificateId $kvcertId -KeyVault $keyvault
