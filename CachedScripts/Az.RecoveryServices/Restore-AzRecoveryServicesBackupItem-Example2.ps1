
$vault = Get-AzRecoveryServicesVault -ResourceGroupName "resourceGroup" -Name "vaultName"

$BackupItem = Get-AzRecoveryServicesBackupItem -BackupManagementType "AzureVM" -WorkloadType "AzureVM" -Name "V2VM" -VaultId $vault.ID

$StartDate = (Get-Date).AddDays(-7)

$EndDate = Get-Date

$RP = Get-AzRecoveryServicesBackupRecoveryPoint -Item $BackupItem -StartDate $StartDate.ToUniversalTime() -EndDate $EndDate.ToUniversalTime() -VaultId $vault.ID

$AlternateLocationRestoreJob = Restore-AzRecoveryServicesBackupItem -RecoveryPoint $RP[0] -TargetResourceGroupName "Target_RG" -StorageAccountName "DestStorageAccount" -StorageAccountResourceGroupName "DestStorageAccRG" -TargetVMName "TagetVirtualMachineName" -TargetVNetName "Target_VNet" -TargetVNetResourceGroup "" -TargetSubnetName "subnetName" -VaultId $vault.ID -VaultLocation $vault.Location 

$OriginalLocationRestoreJob = Restore-AzRecoveryServicesBackupItem -RecoveryPoint $RP[0] -StorageAccountName "DestStorageAccount" -StorageAccountResourceGroupName "DestStorageAccRG" -VaultId $vault.ID -VaultLocation $vault.Location 
