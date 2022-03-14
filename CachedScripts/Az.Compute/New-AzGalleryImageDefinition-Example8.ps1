
$rgName = "myResourceGroup"

$galleryName = "myGallery"

$galleryImageDefinitionName = "myImage"

$location = "eastus"

$publisherName = "GreatPublisher"

$offerName = "GreatOffer"

$skuName = "GreatSku"

$disallowedDiskTypes = @("Standard_LRS")

New-AzGalleryImageDefinition -ResourceGroupName $rgName -GalleryName $galleryName -Name $galleryImageDefinitionName -Location $location -Publisher $publisherName -Offer $offerName -Sku $skuName -OsState "Generalized" -OsType "Linux" -DisallowedDiskType $disallowedDiskTypes
