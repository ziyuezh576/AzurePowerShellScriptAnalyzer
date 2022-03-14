
$vault = Get-AzRecoveryServicesVault -ResourceGroupName "resourceGroup" -Name "vaultName"

$item = Get-AzRecoveryServicesBackupItem -BackupManagementType AzureVM -WorkloadType AzureVM -VaultId $vault.ID

$rp = Get-AzRecoveryServicesBackupRecoveryPoint -StartDate (Get-Date).AddDays(-29).ToUniversalTime() -EndDate (Get-Date).AddDays(0).ToUniversalTime() -VaultId $vault.ID -Item $item[3] -Tier VaultArchive

$restoreJob = Restore-AzRecoveryServicesBackupItem -RecoveryPoint $rp[0] -RehydratePriority "Standard" -RehydrateDuration "13" -TargetResourceGroupName "Target_RG" -StorageAccountName "DestAccount" -StorageAccountResourceGroupName "DestRG" -RestoreDiskList $restoreDiskLUNs -VaultId $vault.ID -VaultLocation $vault.Location
