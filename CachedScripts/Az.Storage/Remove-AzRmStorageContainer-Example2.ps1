
$accountObject = Get-AzStorageAccount -ResourceGroupName "myResourceGroup" -AccountName "myStorageAccount"

Remove-AzRmStorageContainer -StorageAccount $accountObject -ContainerName "myContainer"
