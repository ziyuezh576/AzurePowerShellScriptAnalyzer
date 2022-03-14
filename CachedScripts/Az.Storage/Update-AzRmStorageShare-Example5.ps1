
$share = Update-AzRmStorageShare -ResourceGroupName "myresourcegroup" -StorageAccountName "mystorageaccount" -Name "myshare" -RootSquash NoRootSquash 

$share

$share.RootSquash
