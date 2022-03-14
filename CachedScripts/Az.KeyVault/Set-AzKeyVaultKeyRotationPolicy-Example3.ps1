
$key = Get-AzKeyVaultKey -VaultName test-kv -Name test-key

$policy = Get-AzKeyVaultKeyRotationPolicy $key

$policy.ExpiresIn = New-TimeSpan -Days 60

Set-AzKeyVaultKeyRotationPolicy -KeyRotationPolicy $policy
