
Set-AzStorageBlobTag -Container "containername" -Blob testblob -Tag @{"tag1" = "value1"; "tag2" = "value2" } -TagCondition """tag1""='value1'"
