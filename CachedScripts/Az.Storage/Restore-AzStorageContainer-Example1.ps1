
Get-AzStorageContainer -IncludeDeleted -Context $ctx | ? { $_.IsDeleted } | Restore-AzStorageContainer
