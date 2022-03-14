
$blobs = Get-AzStorageBlob -Container "containername" -IncludeTag

$blobs

$blobs[0].Tags
