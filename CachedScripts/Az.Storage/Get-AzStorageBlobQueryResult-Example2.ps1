
$blob = Get-AzStorageBlob -Container $containerName -Blob $blobName -SnapshotTime "2020-07-29T11:08:21.1097874Z" -Context $ctx

$inputconfig = New-AzStorageBlobQueryConfig -AsCsv -ColumnSeparator "," -QuotationCharacter """" -EscapeCharacter "\" -RecordSeparator "`n" -HasHeader

$outputconfig = New-AzStorageBlobQueryConfig -AsJson -RecordSeparator "`n" 

$queryString = "SELECT * FROM BlobStorage WHERE _1 LIKE '1%%'"

$result = $blob | Get-AzStorageBlobQueryResult -QueryString $queryString -ResultFile $localFilePath -InputTextConfiguration $inputconfig -OutputTextConfiguration $outputconfig

$result

$result.BlobQueryError
