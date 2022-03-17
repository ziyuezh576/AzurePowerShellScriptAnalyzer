
$account = New-AzStorageAccount -ResourceGroupName "MyResourceGroup" -AccountName "mystorageaccount" -SkuName Standard_LRS  -Location centraluseuap -Kind StorageV2 -PublicNetworkAccess Disabled

$account.PublicNetworkAccess
