
$appgw = Remove-AzApplicationGatewayIdentity -ApplicationGateway $appgw

$updatedgateway = Set-AzApplicationGateway -ApplicationGateway $appgw
