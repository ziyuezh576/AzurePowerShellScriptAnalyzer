
$blob = Set-AzStorageBlobImmutabilityPolicy -Container $containerName -Blob $blobname  -ExpiresOn (Get-Date).AddDays(100) -PolicyMode Unlocked

$blob

$blob.BlobProperties.ImmutabilityPolicy
