
New-AzStorageAccount -ResourceGroupName "MyResourceGroup" -AccountName "mystorageaccount" -Location "eastus2euap" -SkuName "Standard_LRS" -Kind StorageV2  -EncryptionKeyTypeForTable Account -EncryptionKeyTypeForQueue Account -RequireInfrastructureEncryption

$account = get-AzStorageAccount -ResourceGroupName $rgname -StorageAccountName $accountName

$account.Encryption.Services.Queue

$account.Encryption.Services.Table

$account.Encryption.RequireInfrastructureEncryption
