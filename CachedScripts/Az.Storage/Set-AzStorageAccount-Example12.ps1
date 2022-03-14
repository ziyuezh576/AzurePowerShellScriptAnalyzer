
$account = Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -AccountName "mystorageaccount" -MinimumTlsVersion TLS1_1 -AllowBlobPublicAccess $false -AllowSharedKeyAccess $true

$account.MinimumTlsVersion

$account.AllowBlobPublicAccess

$a.AllowSharedKeyAccess
