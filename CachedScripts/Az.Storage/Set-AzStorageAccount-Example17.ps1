
$account = Set-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -IdentityType SystemAssignedUserAssigned -UserAssignedIdentityId $useridentity2 -KeyVaultUserAssignedIdentityId $useridentity2

$account = Set-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -KeyVaultUri $keyvaultUri2 -KeyName $keyname2 -KeyVersion $keyversion2
