
$containers =  Get-AzStorageContainer -IncludeDeleted -Context $ctx 

$containers

$c[1].BlobContainerProperties
