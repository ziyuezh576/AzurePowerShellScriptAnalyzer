
$Gateway = Get-AzP2SVpnGateway -Name "ContosoVirtualGateway" -ResourceGroupName "RGName"

Reset-AzP2sVpnGateway -P2SVpnGateway $Gateway
