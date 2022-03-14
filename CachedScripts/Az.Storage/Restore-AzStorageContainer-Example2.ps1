
Get-AzStorageContainer -IncludeDeleted -Context $ctx | ? { $_.IsDeleted } 

Restore-AzStorageContainer -Name container1 -VersionId 01D685BC91A88F22 -Context $ctx
