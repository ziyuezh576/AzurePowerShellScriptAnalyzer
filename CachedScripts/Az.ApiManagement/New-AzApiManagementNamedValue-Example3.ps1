
$secretIdentifier = 'https://contoso.vault.azure.net/secrets/xxxx'

$keyvault = New-AzApiManagementKeyVaultObject -SecretIdentifier $secretIdentifier 

$keyVaultNamedValue = New-AzApiManagementNamedValue -Context $context -NamedValueId $keyVaultNamedValueId -Name $keyVaultNamedValueName -keyVault $keyvault -Secret
