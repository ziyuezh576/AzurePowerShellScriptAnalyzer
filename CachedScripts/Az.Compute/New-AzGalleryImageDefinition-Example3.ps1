
$rgName = "myResourceGroup"

$galleryName = "myGallery"

$galleryImageDefinitionName = "myImage"

$location = "eastus"

$publisherName = "GreatPublisher"

$offerName = "GreatOffer"

$skuName = "GreatSku"

$description = "My gallery"

New-AzGalleryImageDefinition -ResourceGroupName $rgName -GalleryName $galleryName -Name $galleryImageDefinitionName -Location $location -Publisher $publisherName -Offer $offerName -Sku $skuName -OsState "Specialized" -OsType "Windows" -Description $description
