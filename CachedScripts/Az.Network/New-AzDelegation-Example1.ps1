
$delegation = New-AzDelegation -Name "myDelegation" -ServiceName "Microsoft.Sql/servers"

$vnet = Get-AzVirtualNetwork -Name "myVNet" -ResourceGroupName "myResourceGroup"

$subnet = Get-AzVirtualNetworkSubnetConfig -Name "mySubnet" -VirtualNetwork $vnet

$subnet.Delegations.Add($delegation)

Set-AzVirtualNetwork $vnet
