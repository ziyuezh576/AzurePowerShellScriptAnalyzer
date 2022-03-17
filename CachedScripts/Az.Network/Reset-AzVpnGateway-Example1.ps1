
$Gateway = Get-AzVpnGateway -Name "ContosoVirtualGateway" -ResourceGroupName "RGName"

Reset-AzVpnGateway -VpnGateway $Gateway
