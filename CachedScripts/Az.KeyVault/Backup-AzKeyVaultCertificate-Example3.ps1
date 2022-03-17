
$cert = Get-AzKeyVaultCertificate -VaultName 'MyKeyVault' -Name 'MyCert'

Backup-AzKeyVaultCertificate -Certificate $cert -OutputFile 'C:\Backup.blob' -Force
