
$AppGW = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

$secret = Get-AzKeyVaultCertificate -VaultName "keyvault01" -Name "sslCert01"

$secretId = $secret.Id # https://<keyvaultname>.vault.azure.net/secrets/<hash>

$AppGW = Add-AzApplicationGatewaySslCertificate -ApplicationGateway $AppGW -Name "Cert01" -KeyVaultSecretId $secretId
