
$AppGW = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

$Rules = Get-AzApplicationGatewayRequestRoutingRule -ApplicationGateway $AppGW
