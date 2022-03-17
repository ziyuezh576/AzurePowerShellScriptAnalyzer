
$secret = Get-AzKeyVaultSecret -VaultName "keyvault01" -Name "sslCert01"

$secretId = $secret.Id # https://<keyvaultname>.vault.azure.net/secrets/<hash>

$cert = New-AzApplicationGatewaySslCertificate -Name "Cert01" -KeyVaultSecretId $secretId
