
Get-AzKeyVaultManagedStorageAccount -VaultName myVault -Name myAccount -InRemovedState

Undo-AzKeyVaultManagedStorageAccountRemoval -VaultName myVault -Name myAccount
