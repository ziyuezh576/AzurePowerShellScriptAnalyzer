
$CorsRules = Get-AzStorageCORSRule -ServiceType Blob

$CorsRules[0].AllowedHeaders = @("x-ms-blob-content-type", "x-ms-blob-content-disposition")

$CorsRules[0].AllowedMethods = @("Get", "Connect", "Merge")

Set-AzStorageCORSRule -ServiceType Blob -CorsRules $CorsRules
