
$AppGw = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

$profile  = Get-AzApplicationGatewaySslProfile -Name "Profile01" -ApplicationGateway $AppGw

Remove-AzApplicationGatewayClientAuthConfiguration -SslProfile $profile

Set-AzApplicationGateway -ApplicationGateway $AppGW
