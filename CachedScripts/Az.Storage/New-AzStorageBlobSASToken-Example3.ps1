
$ctx = New-AzStorageContext -StorageAccountName $accountName -UseConnectedAccount

$StartTime = Get-Date

$EndTime = $startTime.AddDays(6)

New-AzStorageBlobSASToken -Container "ContainerName" -Blob "BlobName" -Permission rwd -StartTime $StartTime -ExpiryTime $EndTime -context $ctx
