
$rgName = "myResourceGroup"

$galleryName = "myGallery"

$galleryImageDefinitionName = "myImage"

$location = "eastus"

$publisherName = "GreatPublisher"

$offerName = "GreatOffer"

$skuName = "GreatSku"

$minMemory = 32

$maxMemory = 128

$minVCPU = 2

$maxVCPU = 8

New-AzGalleryImageDefinition -ResourceGroupName $rgName -GalleryName $galleryName -Name $galleryImageDefinitionName -Location $location -Publisher $publisherName -Offer $offerName -Sku $skuName -OsState "Generalized" -OsType "Linux" -MinimumMemory $minMemory -MaximumMemory $maxMemory -MinimumVCPU $minVCPU -MaximumVCPU $maxVCPU
