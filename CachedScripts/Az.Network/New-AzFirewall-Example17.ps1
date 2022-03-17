
$rgName = "resourceGroupName"

$vnet = Get-AzVirtualNetwork -ResourceGroupName $rgName -Name "vnet"

$mgmtPip = Get-AzPublicIpAddress -ResourceGroupName $rgName -Name "managementPublicIpName"

New-AzFirewall -Name "azFw" -ResourceGroupName $rgName -Location centralus -VirtualNetwork $vnet -ManagementPublicIpAddress $mgmtPip
