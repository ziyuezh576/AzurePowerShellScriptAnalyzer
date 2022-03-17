
$rgName = "myResourceGroup"

$galleryName = "myGallery"

$galleryImageDefinitionName = "myImage"

$galleryImageVersionName = "1.0.0"

$location = "eastus"

$osDisk = @{Source = @{Id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myDiskRG/providers/Microsoft.Compute/disks/myOSDisk" }}

New-AzGalleryImageVersion -ResourceGroupName $rgName -GalleryName $galleryName -GalleryImageDefinitionName $galleryImageDefinitionName -Name $galleryImageVersionName -Location $location -OSDiskImage $osDisk
