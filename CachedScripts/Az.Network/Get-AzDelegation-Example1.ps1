
$subnet = Get-AzVirtualNetwork -Name "myVNet" -ResourceGroupName "myResourceGroup" | Get-AzVirtualNetworkSubnetConfig -Name "mySubnet"

Get-AzDelegation -Name "myDelegation" -Subnet $subnet
