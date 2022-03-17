
$account = Set-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName  -IdentityType SystemAssignedUserAssigned

Set-AzKeyVaultAccessPolicy -VaultName $keyvaultName -ResourceGroupName $resourceGroupName -ObjectId $account.Identity.PrincipalId -PermissionsToKeys get,wrapkey,unwrapkey -BypassObjectIdValidation

$account = Set-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -IdentityType SystemAssignedUserAssigned -KeyName $keyname -KeyVaultUri $keyvaultUri -KeyVaultUserAssignedIdentityId ""

$account.Encryption.EncryptionIdentity

$account.Encryption.KeyVaultProperties
