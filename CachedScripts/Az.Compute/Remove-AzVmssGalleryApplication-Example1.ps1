
$vmss = Get-AzVmss -ResourceGroupName $rgname -Name $vmssName

Remove-AzVmssGalleryApplication -VM $vmss.VirtualMachineProfile -GalleryApplicationReferenceId $refId
