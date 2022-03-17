
$rgName = "resourceGroupName"

$vnet = Get-AzVirtualNetwork -ResourceGroupName $rgName -Name "vnet"

$pip = Get-AzPublicIpAddress -ResourceGroupName $rgName -Name "publicIpName"

$fp = Get-AzFirewallPolicy -ResourceGroupName $rgName -Name "fp"

New-AzFirewall -Name "azFw" -ResourceGroupName $rgName -Location centralus -VirtualNetwork $vnet -PublicIpAddress $pip -FirewallPolicyId $fp
