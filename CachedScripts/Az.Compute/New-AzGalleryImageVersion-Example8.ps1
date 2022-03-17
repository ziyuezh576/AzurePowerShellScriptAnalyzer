
$rgName = "myResourceGroup"

$galleryName = "myGallery"

$galleryImageDefinitionName = "myImage"

$galleryImageVersionName = "1.0.0"

$location = "eastus"

$osSnapshot = @{Source = @{Id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mySnapshotRG/providers/Microsoft.Compute/snapshots/myOSSnapshot" }}

$dataDisk0 = @{Source = @{Id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myDiskRG/providers/Microsoft.Compute/disks/myDataDisk" }; Lun = 0; }

$dataDisks = @($dataDisk0)

New-AzGalleryImageVersion -ResourceGroupName $rgName -GalleryName $galleryName -GalleryImageDefinitionName $galleryImageDefinitionName -Name $galleryImageVersionName -Location $location -OSDiskImage $osSnapshot  -DataDiskImage $dataDisks
