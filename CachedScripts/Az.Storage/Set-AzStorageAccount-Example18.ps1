
$account = Set-AzStorageAccount -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -AllowCrossTenantReplication $false -EnableHttpsTrafficOnly $true

$account.AllowCrossTenantReplication
