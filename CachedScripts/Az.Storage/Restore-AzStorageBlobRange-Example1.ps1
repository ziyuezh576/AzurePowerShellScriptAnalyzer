
$range1 = New-AzStorageBlobRangeToRestore -StartRange container1/blob1 -EndRange container2/blob2

$range2 = New-AzStorageBlobRangeToRestore -StartRange container3/blob3 -EndRange container4/blob4

Restore-AzStorageBlobRange -ResourceGroupName "myresourcegoup" -StorageAccountName "mystorageaccount" -TimeToRestore (Get-Date).AddDays(-1) -BlobRestoreRange $range1,$range2

(Get-AzStorageAccount -ResourceGroupName $rgname -StorageAccountName $accountName -IncludeBlobRestoreStatus).BlobRestoreStatus 
