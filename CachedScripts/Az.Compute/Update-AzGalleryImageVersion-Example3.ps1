
$rgName = "myResourceGroup"

$galleryName = "myGallery"

$imageName = "myImage"

$versionName = "1.0.0"

$endOfLifeDate = "2024-08-02T00:00:00+00:00"

Update-AzGalleryImageVersion -ResourceGroupName $rgname -GalleryName $galleryName -GalleryImageDefinitionName $imageName -Name $versionName -PublishingProfileEndOfLifeDate $endOfLifeDate
