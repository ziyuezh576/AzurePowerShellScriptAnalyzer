
$StartTime = Get-Date

$EndTime = $startTime.AddHours(2.0)

New-AzStorageBlobSASToken -Container "ContainerName" -Blob "BlobName" -Permission rwd -StartTime $StartTime -ExpiryTime $EndTime
