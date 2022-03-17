
$Vault01 = Get-AzRecoveryServicesVault -Name "TestVault"

Set-AzRecoveryServicesBackupProperty -Vault $Vault01 -BackupStorageRedundancy GeoRedundant
