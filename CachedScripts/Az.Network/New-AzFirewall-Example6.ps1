
$rgName = "resourceGroupName"

$vnet = Get-AzVirtualNetwork -ResourceGroupName $rgName -Name "vnet"

$pip = Get-AzPublicIpAddress -ResourceGroupName $rgName -Name "publicIpName"

New-AzFirewall -Name "azFw" -ResourceGroupName $rgName -Location centralus -VirtualNetworkName $vnet.Name -PublicIpName $pip.Name -Zone 1,2,3
