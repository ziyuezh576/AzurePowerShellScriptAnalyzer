
$AppGw = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

Remove-AzApplicationGatewaySslProfile -ApplicationGateway $AppGw -Name "SslProfile01"

Set-AzApplicationGateway -ApplicationGateway $AppGw
