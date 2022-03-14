
$blob = Set-AzStorageBlobLegalHold -Container $containerName -Blob $blobname  -EnableLegalHold

$blob

$blob.BlobProperties.HasLegalHold
