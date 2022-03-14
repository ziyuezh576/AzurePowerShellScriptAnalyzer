
$rgName = "myResourceGroup"

$galleryName = "myGallery"

$galleryImageDefinitionName = "myImage"

$location = "eastus"

$publisherName = "GreatPublisher"

$offerName = "GreatOffer"

$skuName = "GreatSku"

$purchasePlanName = "myPlanName"

$purchasePlanProduct = "myPlanProduct"

$purchasePlanPublisher = "myPlanPublisher"

New-AzGalleryImageDefinition -ResourceGroupName $rgName -GalleryName $galleryName -Name $galleryImageDefinitionName -Location $location -Publisher $publisherName -Offer $offerName -Sku $skuName -OsState "Generalized" -OsType "Linux" -PurchasePlanName $purchasePlanName -PurchasePlanProduct $purchasePlanProduct -PurchasePlanPublisher $purchasePlanPublisher
