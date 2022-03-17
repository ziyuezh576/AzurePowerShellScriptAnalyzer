
Get-AzStorageShare -Prefix "test" | New-AzStorageShareSASToken -Permission "rwdl"
