
$Appgw = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

$Listeners = Get-AzApplicationGatewayHttpListener -ApplicationGateway $Appgw
