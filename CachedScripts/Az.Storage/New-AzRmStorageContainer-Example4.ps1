
$container = New-AzRmStorageContainer -ResourceGroupName "myersourcegroup" -AccountName "mystorageaccount" -Name "mycontainer" -RootSquash AllSquash

$container.EnableNfsV3AllSquash

$container.EnableNfsV3RootSquash
