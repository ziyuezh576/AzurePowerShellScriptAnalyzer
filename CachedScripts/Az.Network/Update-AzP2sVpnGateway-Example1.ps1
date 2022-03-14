
$vpnClientAddressSpaces = New-Object string[] 1 

$vpnClientAddressSpaces[0] = "101.10.0.0/16"

Update-AzP2sVpnGateway -ResourceGroupName P2SCortexGATesting -Name 683482ade8564515aed4b8448c9757ea-westus-gw -VpnClientAddressPool $vpnClientAddressSpaces -EnableInternetSecurityFlag                                
