
$AppGW = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

$AppGW = Remove-AzApplicationGatewaySslPolicy -ApplicationGateway $AppGW

Set-AzApplicationGateway -ApplicationGateway $AppGW
