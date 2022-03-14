
$AppGw = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

$GatewaySubnets = Get-AzApplicationGatewayIPConfiguration -ApplicationGateway $AppGw
