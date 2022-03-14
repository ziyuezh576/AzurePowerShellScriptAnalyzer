
$AppGW = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

$sslpolicy = Get-AzApplicationGatewaySslPolicy -ApplicationGateway $AppGW
