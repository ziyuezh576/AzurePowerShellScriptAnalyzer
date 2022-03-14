
$secret = Get-AzKeyVaultSecret -VaultName 'MyKeyVault' -Name 'MySecret'

Backup-AzKeyVaultSecret -Secret $secret -OutputFile 'C:\Backup.blob'
