
New-AzCdnEndpoint -ResourceGroupName myresourcegroup -ProfileName mycdnprofile -Location westus -EndpointName myendpoint `
                  -OriginName mystorage -OriginHostName mystorage.blob.core.windows.net `
                  -OriginHostHeader mystorage.blob.core.windows.net -IsHttpAllowed $false
