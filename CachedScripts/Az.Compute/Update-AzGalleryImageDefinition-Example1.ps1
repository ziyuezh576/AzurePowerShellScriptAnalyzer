
$rgName = "myResourceGroup"

$galleryName = "myGallery"

$imageName = "myImage"

$versionName = "1.0.0"

$minVCPU = 1

$maxVCPU = 4

$minMemory = 1

$maxMemory = 8

$description = "My image definition"

$endOfLifeDate = "2024-08-02T00:00:00+00:00"

Update-AzGalleryImageDefinition -ResourceGroupName $resourceGroupName -GalleryName $galleryName -Name $galleryImageDefinitionName -Description $description -EndOfLifeDate $endOfLifeDate -MinimumMemory $minMemory -MaximumMemory $maxMemory -MinimumVCPU $minVCPU -MaximumVCPU $maxVCPU
