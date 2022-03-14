
$account = New-AzStorageAccount -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -SkuName Premium_LRS -Location westus -EdgeZone "microsoftlosangeles1" -AllowCrossTenantReplication $false

$account.ExtendedLocation

$account.AllowCrossTenantReplication
