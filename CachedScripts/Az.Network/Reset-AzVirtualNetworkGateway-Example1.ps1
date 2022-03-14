
$Gateway = Get-AzVirtualNetworkGateway -Name "ContosoVirtualGateway"

Reset-AzVirtualNetworkGateway -VirtualNetworkGateway $Gateway
