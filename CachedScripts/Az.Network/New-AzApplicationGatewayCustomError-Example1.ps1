
$customError403Url = "https://mycustomerrorpages.blob.core.windows.net/errorpages/403-another.htm"

$ce = New-AzApplicationGatewayCustomError -StatusCode HttpStatus403 -CustomErrorPageUrl $customError403Url
