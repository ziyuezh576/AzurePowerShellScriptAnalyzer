
$vault = Get-AzRecoveryServicesVault -ResourceGroupName "resourceGroup" -Name "vaultName"

$vaultProperty = Get-AzRecoveryServicesVaultProperty -VaultId $vault.Id

$vaultProperty.encryptionProperties
