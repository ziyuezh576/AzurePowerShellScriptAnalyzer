
$vault = Get-AzRecoveryServicesVault -ResourceGroupName "resourceGroup" -Name "vaultName"

Get-AzRecoveryServicesBackupContainer -ContainerType Windows -BackupManagementType MAB -VaultId $vault.ID
