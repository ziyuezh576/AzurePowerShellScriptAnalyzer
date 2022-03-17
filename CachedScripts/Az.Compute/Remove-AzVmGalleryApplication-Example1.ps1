
$vm = Get-AzVm -ResourceGroupName $rgname -Name $vmName

Remove-AzVmGalleryApplication -VM $vm -GalleryApplicationReferenceId $refId
