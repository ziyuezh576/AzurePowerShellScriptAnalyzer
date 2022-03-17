
$rgName = "myResourceGroup"

$galleryName = "myGallery"

$galleryImageDefinitionName = "myImage"

$galleryImageVersionName = "1.0.0"

$location = "eastus"

$sourceImageId = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myVMRG/providers/Microsoft.Compute/virtualMachines/myVM"

$replicaCount = 1

$storageAccountType = "Standard_ZRS"

$eastUSdes = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myDESrg/providers/Microsoft.Compute/diskEncryptionSets/myEastUSDES"

$encryption_eastus_os = @{DiskEncryptionSetId = $eastUSdes }

$encryption_eastus_dd0 = @{DiskEncryptionSetId = $eastUSdes; Lun = 0 }

$encryption_eastus_dd = @($encryption_eastus_dd0)

$eastus_encryption = @{OSDiskImage = $eastus_encryption_os; DataDiskImages = $eastus_encryption_dd }

$region_eastus = @{Name = 'East US';ReplicaCount = 3;StorageAccountType = Standard_LRS; Encryption = $encryption_eastus}

$westUS2des = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myDESrg/providers/Microsoft.Compute/diskEncryptionSets/myWestUSDES"

$encryption_westus_os = @{DiskEncryptionSetId = $westUSdes }

$encryption_westus_dd0 = @{DiskEncryptionSetId = $westUSdes; Lun = 0 }

$encryption_westus_dd = @($encryption_westus_dd0)

$westus_encryption = @{OSDiskImage = $encryption_westus_os; DataDiskImages = $encryption_westus_dd }

$region_westus = @{Name = 'West US'; Encryption = $westus_encryption}}

$targetRegions = @($region_eastus, $region_westus)

New-AzGalleryImageVersion -ResourceGroupName $rgName -GalleryName $galleryName -GalleryImageDefinitionName $galleryImageDefinitionName -Name $galleryImageVersionName -Location $location -SourceImageId $sourceImageId -TargetRegion $targetRegions
