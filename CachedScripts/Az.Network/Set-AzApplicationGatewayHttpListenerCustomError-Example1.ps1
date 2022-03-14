
$customError502Url = "https://mycustomerrorpages.blob.core.windows.net/errorpages/502.htm"

$updatedlistener = Set-AzApplicationGatewayCustomError -HttpListener $listener01 -StatusCode HttpStatus502 -CustomErrorPageUrl $customError502Url
