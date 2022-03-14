
$Gateway = Get-AzVirtualNetworkGateway -Name "ContosoVirtualGateway"

Remove-AzVirtualNetworkGatewayDefaultSite -VirtualNetworkGateway $Gateway
