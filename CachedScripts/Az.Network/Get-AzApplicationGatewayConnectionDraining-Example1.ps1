
$AppGw = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

$Settings  = Get-AzApplicationGatewayBackendHttpSettings -Name "Settings01" -ApplicationGateway $AppGw

$ConnectionDraining = Get-AzApplicationGatewayConnectionDraining -BackendHttpSettings $Settings
