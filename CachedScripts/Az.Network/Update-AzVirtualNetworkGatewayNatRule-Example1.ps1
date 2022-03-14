
$natRule1 = get-azVirtualNetworkGatewayNatRule -ResourceGroupName "rg1" -Name "natRule1" -ParentResourceName "gw1"

 Update-AzVirtualNetworkGatewayNatRule -InputObject $natRule1 -ExternalMapping @("30.0.0.0/16") -InternalMapping @("25.0.0.0/16") -IpConfigurationId "/subscriptions/7afd8f92-c220-4f53-886e-1df53a69afd4/resourceGroups/rg1/providers/Microsoft.Network/virtualNetworkGateways/gw1/ipConfigurations/default"
