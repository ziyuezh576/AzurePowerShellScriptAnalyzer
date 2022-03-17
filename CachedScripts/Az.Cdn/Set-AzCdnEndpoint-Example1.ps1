
$endpointObject = Get-AzCdnEndpoint -ResourceGroupName myresourcegroup -ProfileName mycdnprofile -EndpointName myendpoint

$endpointObject.IsHttpAllowed = $false

Set-AzCdnEndpoint -CdnEndpoint $endpointObject
