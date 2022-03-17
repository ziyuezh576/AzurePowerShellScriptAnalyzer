
$account = Set-AzStorageAccount -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -PublicNetworkAccess Enabled

$account.PublicNetworkAccess
