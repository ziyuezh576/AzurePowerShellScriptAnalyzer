
Get-AzVirtualNetworkPeering -VirtualNetworkName "myVnet1" -ResourceGroupName "ResourceGroup" -Name "myVnet1ToMyVnet2"

$myVnet1ToMyVnet2.AllowForwardedTraffic = $True

Set-AzVirtualNetworkPeering -VirtualNetworkPeering $myVnet1ToMyVnet2
