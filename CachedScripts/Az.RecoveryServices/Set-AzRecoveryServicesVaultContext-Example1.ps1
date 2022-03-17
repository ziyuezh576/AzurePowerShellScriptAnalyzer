
$vault = Get-AzRecoveryServicesVault -ResourceGroupName "resourceGroup" -Name "vaultName"

Set-AzRecoveryServicesVaultContext -Vault $vault
