
$AppGw = Get-AzApplicationGateway -Name Test -ResourceGroupName Appgwtest

$AppGw.Tag = @{"key"="value"}

$UpdatedAppGw = Set-AzApplicationGateway -ApplicationGateway $AppGw
