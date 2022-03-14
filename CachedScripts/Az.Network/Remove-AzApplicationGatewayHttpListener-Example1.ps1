
$AppGw = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

Remove-AzApplicationGatewayHttpListener -ApplicationGateway $AppGw -Name "Listener02"

Set-AzApplicationGateway -ApplicationGateway $AppGW
