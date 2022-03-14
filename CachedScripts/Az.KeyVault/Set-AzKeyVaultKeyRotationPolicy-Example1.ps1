
$t = New-TimeSpan -Days 50

Set-AzKeyVaultKeyRotationPolicy -VaultName test-kv -Name test-key -ExpiresIn $t
