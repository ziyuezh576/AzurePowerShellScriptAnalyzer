
$gateway = Get-AzVirtualNetworkGateway -ResourceGroupName myRg -Name gw1

$natRule = New-AzVirtualNetworkGatewayNatRule -Name "natRule1" -Type "Static" -Mode "IngressSnat" -InternalMapping @("25.0.0.0/16") -ExternalMapping @("30.0.0.0/16") -InternalPortRange @("100-100") -ExternalPortRange @("200-200")

Set-AzVirtualNetworkGateway -VirtualNetworkGateway $gateway -NatRule $natRule
