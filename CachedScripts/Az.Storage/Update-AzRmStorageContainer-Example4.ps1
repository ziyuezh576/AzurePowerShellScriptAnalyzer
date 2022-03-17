
$container = Update-AzRmStorageContainer -ResourceGroupName "myersourcegroup" -AccountName "mystorageaccount" -Name "mycontainer" -RootSquash NoRootSquash

$container.EnableNfsV3AllSquash

$container.EnableNfsV3RootSquash
