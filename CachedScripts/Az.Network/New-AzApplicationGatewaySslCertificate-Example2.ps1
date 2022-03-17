
$secret = Get-AzKeyVaultSecret -VaultName "keyvault01" -Name "sslCert01"

$secretId = $secret.Id.Replace($secret.Version, "") # https://<keyvaultname>.vault.azure.net/secrets/

$cert = New-AzApplicationGatewaySslCertificate -Name "Cert01" -KeyVaultSecretId $secretId
