
$rgName = "myResourceGroup"

$galleryName = "myGallery"

$galleryImageDefinitionName = "myImage"

$galleryImageVersionName = "1.0.0"

$location = "eastus"

$sourceImageId = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myVMRG/providers/Microsoft.Compute/virtualMachines/myVM"

$replicaCount = 1

$storageAccountType = "Standard_ZRS"

$region_eastus = @{Name = 'East US';ReplicaCount = 3;StorageAccountType = Standard_LRS}

$region_westus = @{Name = 'West US'}

$region_ukwest = @{Name = 'UK West';ReplicaCount = 2}

$region_southcentralus = @{Name = 'South Central US';StorageAccountType = Standard_LRS}

$targetRegions = @($region_eastus, $region_westus, $region_ukwest, $region_southcentralus)

New-AzGalleryImageVersion -ResourceGroupName $rgName -GalleryName $galleryName -GalleryImageDefinitionName $galleryImageDefinitionName -Name $galleryImageVersionName -Location $location -SourceImageId $sourceImageId -ReplicaCount 1 -StorageAccountType $storageAccountType -TargetRegion $targetRegions
