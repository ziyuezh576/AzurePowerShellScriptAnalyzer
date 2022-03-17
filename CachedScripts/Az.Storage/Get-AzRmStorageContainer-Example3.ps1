
$accountObject = Get-AzStorageAccount -ResourceGroupName "myResourceGroup" -AccountName "myStorageAccount"

Get-AzRmStorageContainer -StorageAccount $accountObject -ContainerName "myContainer"
