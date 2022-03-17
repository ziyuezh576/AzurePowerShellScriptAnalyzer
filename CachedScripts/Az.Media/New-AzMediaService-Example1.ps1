
$ResourceGroupName = "ResourceGroup001"

$Location = "East US"

$StorageName = "Storage1"

$StorageType = "Standard_GRS"

$Tags = @{"tag1" = "value1"; "tag2" = "value2"}

$MediaServiceName = "MediaService1"

New-AzResourceGroup -Name $ResourceGroupName -Location $Location

$StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageName -Location $Location -Type $StorageType

New-AzMediaService -ResourceGroupName $ResourceGroupName -AccountName $MediaServiceName -Location $Location -StorageAccountId $StorageAccount.Id -Tag $Tags
