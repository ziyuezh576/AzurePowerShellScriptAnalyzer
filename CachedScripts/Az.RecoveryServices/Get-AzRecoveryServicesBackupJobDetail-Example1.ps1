
$vault = Get-AzRecoveryServicesVault -ResourceGroupName "resourceGroup" -Name "vaultName"

$Jobs = Get-AzRecoveryServicesBackupJob -Status Failed -VaultId $vault.ID

$JobDetails = Get-AzRecoveryServicesBackupJobDetail -Job $Jobs[0] -VaultId $vault.ID

$JobDetails.ErrorDetails
