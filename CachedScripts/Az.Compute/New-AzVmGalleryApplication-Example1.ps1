
$vm = Get-AzVm -ResourceGroupName $rgName -Name $vmName

$vmGal = New-AzVmGalleryApplication -PackageReferenceId $packageRefId -ConfigReferenceId $configRefId

Add-AzVmGalleryApplication -VM $vm -GalleryApplication $vmGal -Order 1
