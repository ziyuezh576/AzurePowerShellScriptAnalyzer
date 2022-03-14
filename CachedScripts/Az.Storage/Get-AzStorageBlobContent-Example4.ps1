
$blob = Get-AzStorageBlob -Container containername -Blob blobname 

Get-AzStorageBlobContent -CloudBlob $blob.ICloudBlob -Destination "C:\test"
