
$Gateway = Get-AzVirtualNetworkGateway -ResourceGroupName "ResourceGroup001" -Name "Gateway001"

$vngNatRules = $Gateway.NatRules

$natRule = New-AzVirtualNetworkGatewayNatRule -Name "natRule1" -Type "Static" -Mode "IngressSnat" -InternalMapping @("25.0.0.0/16") -ExternalMapping @("30.0.0.0/16")

$vngNatRules.Add($natrule)

Set-AzVirtualNetworkGateway -VirtualNetworkGateway $Gateway -NatRule $vngNatRules.NatRules -BgpRouteTranslationForNat $true
