
$accountObject = Get-AzStorageAccount -ResourceGroupName "myResourceGroup" -StorageAccountName "myStorageAccount"

Remove-AzRmStorageShare -StorageAccount $accountObject -Name "myshare"
