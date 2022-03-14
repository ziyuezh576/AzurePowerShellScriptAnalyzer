
$keyVault = New-AzKeyVault -VaultName $keyvaultName -ResourceGroupName $resourceGroupName -Location eastus2euap -EnablePurgeProtection

$key = Add-AzKeyVaultKey -VaultName $keyvaultName -Name $keyname -Destination 'Software'

$userId = New-AzUserAssignedIdentity -ResourceGroupName $resourceGroupName -Name $userIdName

Set-AzKeyVaultAccessPolicy -VaultName $keyvaultName -ResourceGroupName $resourceGroupName -ObjectId $userId.PrincipalId -PermissionsToKeys get,wrapkey,unwrapkey -BypassObjectIdValidation

$useridentityId= $userId.Id

$account = New-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -Kind StorageV2 -SkuName Standard_LRS -Location eastus2euap `
                -IdentityType SystemAssignedUserAssigned  -UserAssignedIdentityId $useridentityId  `
                -KeyVaultUri $keyVault.VaultUri -KeyName $keyname -KeyVaultUserAssignedIdentityId $useridentityId

$account.Encryption.EncryptionIdentity

$account.Encryption.KeyVaultProperties
