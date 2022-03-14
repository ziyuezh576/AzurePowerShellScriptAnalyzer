
$AppGw = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

Remove-AzApplicationGatewayCustomError -ApplicationGateway $AppGw -StatusCode HttpStatus502

Set-AzApplicationGateway -ApplicationGateway $AppGW
