
$resourceGroupName = "resourceGroupName"

$AppGWName = "applicationGatewayName"

$AppGw = Get-AzApplicationGateway -Name $AppGWName -ResourceGroup $resourceGroupName

$customError502Url = "https://mycustomerrorpages.blob.core.windows.net/errorpages/502.htm"

$updatedgateway = Add-AzApplicationGatewayCustomError -ApplicationGateway $AppGw -StatusCode HttpStatus502 -CustomErrorPageUrl $customError502Url

Set-AzApplicationGateway -ApplicationGateway $AppGw
