
$vault = Get-AzRecoveryServicesVault -ResourceGroupName "resourceGroup" -Name "vaultName"

$startDate = (Get-Date).AddDays(-7).ToUniversalTime()

$endDate = Get-Date.ToUniversalTime()

$item = Get-AzRecoveryServicesBackupItem -BackupManagementType "AzureVM" -WorkloadType "AzureVM" -VaultId $vault.ID

$rp = Get-AzRecoveryServicesBackupRecoveryPoint -StartDate $startDate -EndDate $endDate -VaultId $vault.ID -Item $item[3] 
