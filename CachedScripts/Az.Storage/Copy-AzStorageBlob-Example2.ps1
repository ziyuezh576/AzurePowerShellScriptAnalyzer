
$srcBlob = Get-AzStorageBlob -Container $containerName -Blob $blobName  -Context $ctx 

$destBlob =  $srcBlob | Copy-AzStorageBlob  -DestContainer "destcontainername" -DestBlob "destblobname"
