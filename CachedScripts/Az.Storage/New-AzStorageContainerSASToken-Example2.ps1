
Get-AzStorageContainer -Container test* | New-AzStorageContainerSASToken -Permission rwdl
