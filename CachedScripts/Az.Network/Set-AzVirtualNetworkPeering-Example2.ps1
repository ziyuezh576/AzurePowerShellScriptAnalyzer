
$myVnet1TomyVnet2 = Get-AzVirtualNetworkPeering -VirtualNetworkName "myVnet1" -ResourceGroupName "myResourceGroup" -Name "myVnet1TomyVnet2"

$myVnet1TomyVnet2.AllowVirtualNetworkAccess = $False

Set-AzVirtualNetworkPeering -VirtualNetworkPeering $myVnet1TomyVnet2
