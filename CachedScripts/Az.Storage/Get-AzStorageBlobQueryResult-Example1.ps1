
$inputconfig = New-AzStorageBlobQueryConfig -AsCsv -HasHeader

$outputconfig = New-AzStorageBlobQueryConfig -AsJson

$queryString = "SELECT * FROM BlobStorage WHERE Name = 'a'"

$result = Get-AzStorageBlobQueryResult -Container $containerName -Blob $blobName -QueryString $queryString -ResultFile "c:\resultfile.json" -InputTextConfiguration $inputconfig -OutputTextConfiguration $outputconfig -Context $ctx

$result
