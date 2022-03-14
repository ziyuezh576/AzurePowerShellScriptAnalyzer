
$AppGw = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

$SettingsList  = Get-AzApplicationGatewayBackendHttpSetting -ApplicationGateway $AppGw
