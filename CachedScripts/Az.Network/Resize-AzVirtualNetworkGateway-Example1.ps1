
$Gateway = Get-AzVirtualNetworkGateway -Name "ContosoVirtualGateway"

Resize-AzVirtualNetworkGateway -VirtualNetworkGateway $Gateway -GatewaySku "Basic"
