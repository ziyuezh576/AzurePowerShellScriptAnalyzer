
$key = Get-AzKeyVaultKey -VaultName 'MyKeyVault' -Name 'MyKey'

Backup-AzKeyVaultKey -Key $key -OutputFile 'C:\Backup.blob' -Force
