
$myVnet1TomyVnet2 = Get-AzVirtualNetworkPeering -VirtualNetworkName "myVnet1" -ResourceGroupName "ResourceGroup001" -Name "myVnet1TomyVnet2"

$myVnet1TomyVnet2.UseRemoteGateways = $True

Set-AzVirtualNetworkPeering -VirtualNetworkPeering $myVnet1TomyVnet2
