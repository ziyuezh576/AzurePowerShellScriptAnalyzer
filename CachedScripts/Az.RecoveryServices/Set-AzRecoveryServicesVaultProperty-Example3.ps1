
$vault = Get-AzRecoveryServicesVault -ResourceGroupName "rgName" -Name "vaultName"

$keyVault = Get-AzKeyVault -VaultName "keyVaultName" -ResourceGroupName "RGName" 

$key = Get-AzKeyVaultKey -VaultName "keyVaultName" -Name "keyName" 

Set-AzRecoveryServicesVaultProperty -EncryptionKeyId $key.ID -VaultId $vault.ID -UseSystemAssignedIdentity $false -UserAssignedIdentity $vault.Identity.UserAssignedIdentities.Keys[0]
