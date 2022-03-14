
$ResourceGroupName = "ResourceGroup001"

$Location = "East US"

$StorageName1 = "storage1"

$StorageName2 = "storage2"

$StorageType = "Standard_GRS"

$Tags = @{"tag1" = "value1"; "tag2" = "value2"}

$MediaServiceName = "MediaService1"

New-AzResourceGroup -Name $ResourceGroupName -Location $Location

$StorageAccount1 = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageName1 -Location $Location -Type $StorageType

$StorageAccount2 = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageName2 -Location $Location -Type $StorageType

$PrimaryStorageAccount = New-AzMediaServiceStorageConfig -StorageAccountId $StorageAccount1.Id -IsPrimary

$SecondaryStorageAccount = New-AzMediaServiceStorageConfig -StorageAccountId $StorageAccount2.Id

$StorageAccounts = @($PrimaryStorageAccount, $SecondaryStorageAccount)
