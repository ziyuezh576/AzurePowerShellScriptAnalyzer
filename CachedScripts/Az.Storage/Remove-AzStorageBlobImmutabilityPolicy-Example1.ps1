
$blob = Remove-AzStorageBlobImmutabilityPolicy -Container $containerName -Blob $blobname  

$blob

$blob.BlobProperties.ImmutabilityPolicy
