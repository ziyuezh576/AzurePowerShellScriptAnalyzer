
$vault = Get-AzRecoveryServicesVault -ResourceGroupName "resourceGroup" -Name "vaultName"

$Joblist = Get-AzRecoveryServicesBackupJob -Status InProgress -VaultId $vault.ID

$Joblist[0]
