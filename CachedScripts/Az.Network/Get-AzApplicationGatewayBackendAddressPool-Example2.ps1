
$AppGw = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

$BackendPools = Get-AzApplicationGatewayBackendAddressPool -ApplicationGateway $AppGw
