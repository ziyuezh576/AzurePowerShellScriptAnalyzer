
$customError502Url = "https://mycustomerrorpages.blob.core.windows.net/errorpages/502.htm"

$updatedgateway = Set-AzApplicationGatewayCustomError -ApplicationGateway $appgw -StatusCode HttpStatus502 -CustomErrorPageUrl $customError502Url
