
$StorageAccount = Get-AzStorageAccount -ResourceGroupName "ResourceGroup001" -Name "Storage135"

Sync-AzMediaServiceStorageKey -ResourceGroupName "ResourceGroup001" -AccountName "MediasService001" -StorageAccountId $StorageAccount.Id
