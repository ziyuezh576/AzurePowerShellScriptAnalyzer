
$ctx = New-AzStorageContext -StorageAccountName $storAccName

$SASToken = new-azstorageblobsastoken -Context $ctx -Container $containerName -blob $blobName -Permission r

$storAcc = Get-AzStorageAccount -ResourceGroupName $rgName -Name $storAccName

$blob = Get-AzStorageBlob -Container $containerName -Blob $blobName -Context $storAcc.Context

$SASToken = New-AzStorageBlobSASToken -Container $containerName -Blob $blobName -Permission rwd -Context $storAcc.Context

$SASUri = $blob.ICloudBlob.Uri.AbsoluteUri + "?" +$SASToken 

Update-AzGalleryApplicationVersion -ResourceGroupName $rgname -Location EastUS -GalleryName $galleryName -GalleryApplicationName $galleryApplicationName -name "0.1.0" -PackageFileLink $SASUri -ReplicaCount 3 
