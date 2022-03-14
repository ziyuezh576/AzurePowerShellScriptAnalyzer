
$rgName = "myResourceGroup"

$galleryName = "myGallery"

$galleryImageDefinitionName = "myImage"

$location = "eastus"

$publisherName = "GreatPublisher"

$offerName = "GreatOffer"

$skuName = "GreatSku"

$eula = "https://myeula"

$privacyStatementUri = "https://mystatement"

$releaseNoteUri = "https://myreleasenotes"

New-AzGalleryImageDefinition -ResourceGroupName $rgName -GalleryName $galleryName -Name $galleryImageDefinitionName -Location $location -Publisher $publisherName -Offer $offerName -Sku $skuName -OsState "Generalized" -OsType "Linux" -Eula $eula -PrivacyStatementUri $privacyStatementUri -ReleaseNoteUri $releaseNoteUri
