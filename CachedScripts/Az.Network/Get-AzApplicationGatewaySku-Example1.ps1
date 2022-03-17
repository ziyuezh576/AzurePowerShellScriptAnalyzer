
$AppGW = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

$SKU = Get-AzApplicationGatewaySku -ApplicationGateway $AppGW
