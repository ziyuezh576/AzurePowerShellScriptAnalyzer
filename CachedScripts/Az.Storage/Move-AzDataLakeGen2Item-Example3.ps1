
$sas = New-AzStorageContainerSASToken -Name $filesystemName -Permission rdw -Context $ctx

$sasctx = New-AzStorageContext -StorageAccountName $ctx.StorageAccountName -SasToken $sas

Move-AzDataLakeGen2Item -FileSystem $filesystemName -Path $itempath1 -DestFileSystem $filesystemName -DestPath "$($itempath2)$($sas)" -Context $sasctx 
