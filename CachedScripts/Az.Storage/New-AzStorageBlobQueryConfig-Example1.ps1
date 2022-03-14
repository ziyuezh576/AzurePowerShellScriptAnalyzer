
$inputconfig = New-AzStorageBlobQueryConfig -AsCsv -ColumnSeparator "," -QuotationCharacter """" -EscapeCharacter "\" -RecordSeparator "`n" -HasHeader

$outputconfig = New-AzStorageBlobQueryConfig -AsJson -RecordSeparator "`n" 

$queryString = "SELECT * FROM BlobStorage WHERE Name = 'a'"

$result = Get-AzStorageBlobQueryResult -Container $containerName -Blob $blobName -QueryString $queryString -ResultFile "c:\resultfile.json" -InputTextConfiguration $inputconfig -OutputTextConfiguration $outputconfig -Context $ctx

$result
