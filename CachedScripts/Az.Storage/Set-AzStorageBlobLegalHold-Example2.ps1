
$blob = Get-AzStorageBlob -Container $containerName -Blob $blobname | Set-AzStorageBlobLegalHold -DisableLegalHold

$blob

$blob.BlobProperties.HasLegalHold
