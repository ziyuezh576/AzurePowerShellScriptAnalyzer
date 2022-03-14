
$Gateway = Get-AzVirtualNetworkGateway -ResourceGroupName "ResourceGroup001" -Name "Gateway001"

Set-AzVirtualNetworkGateway -VirtualNetworkGateway $Gateway -Asn 1337
