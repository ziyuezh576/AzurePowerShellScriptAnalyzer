
$galleryImageVersionID = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myImageRG/providers/Microsoft.Compute/galleries/myGallery/images/myImage/versions/1.0.0"

$location = "eastus"

$rgName = "eastus"

$region = "eastus"

$myDiskName = "myOSDisk"

$imageOSDisk = @{Id = $galleryImageVersionID}

$OSDiskConfig = New-AzDiskConfig -Location $location -CreateOption "FromImage" -GalleryImageReference $imageOSDisk

New-AzDisk -ResourceGroupName $rgName -DiskName $myDiskName -Disk $OSDiskConfig

$myDiskName = "myDataDisk"

$imageDataDisk = @{Id = $galleryImageVersionID; Lun=1}

$dataDiskConfig = New-AzDiskConfig -Location $location -CreateOption "FromImage" -GalleryImageReference $imageDataDisk

New-AzDisk -ResourceGroupName $rgName -DiskName $myDiskName -Disk $dataDiskConfig
