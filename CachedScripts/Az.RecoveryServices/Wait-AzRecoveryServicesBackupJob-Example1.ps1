
$vault = Get-AzRecoveryServicesVault -ResourceGroupName "resourceGroup" -Name "vaultName"

$Jobs = Get-AzRecoveryServicesBackupJob -Status InProgress -VaultId $vault.ID

Wait-AzRecoveryServicesBackupJob -Job $Jobs[0] -VaultId $vault.ID -Timeout 3600
