
$cert = Get-AzKeyVaultCertificate -VaultName $vaultName -Name $certName

$secret = Get-AzKeyVaultSecret -VaultName $vaultName -Name $cert.Name

$secretByte = [Convert]::FromBase64String(($secret.SecretValue | ConvertFrom-SecureString -AsPlainText))
