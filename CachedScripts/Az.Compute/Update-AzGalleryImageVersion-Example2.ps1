
$rgName = "myResourceGroup"

$galleryName = "myGallery"

$imageName = "myImage"

$versionName = "1.0.0"

Update-AzGalleryImageVersion -ResourceGroupName $rgname -GalleryName $galleryName -GalleryImageDefinitionName $imageName -Name $versionName -PublishingProfileExcludeFromLatest:$false
