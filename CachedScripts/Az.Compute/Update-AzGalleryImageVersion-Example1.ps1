
$rgName = "myResourceGroup"

$galleryName = "myGallery"

$imageName = "myImage"

$versionName = "1.0.0"

$region1 = @{Name='West US';ReplicaCount=1}

$region2 = @{Name='East US';ReplicaCount=2}

$region3 = @{Name='Central US'}

$targetRegions = @($region1,$region2,$region3)

Update-AzGalleryImageVersion -ResourceGroupName $rgname -GalleryName $galleryName -GalleryImageDefinitionName $imageName -Name $versionName -ReplicaCount 2 -TargetRegion $targetRegions
