
$path = "D:\public.pem"

Get-AzKeyVaultKey -VaultName $vaultName -KeyName $keyName -OutFile $path
