
$vault = Get-AzRecoveryServicesVault -ResourceGroupName "rgName" -Name "vaultName"

$props = Set-AzRecoveryServicesVaultProperty -VaultId $vault.Id -SoftDeleteFeatureState Enable
