
$AppGw = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

$FrontEndPorts = Get-AzApplicationGatewayFrontendPort  -ApplicationGateway $AppGw
