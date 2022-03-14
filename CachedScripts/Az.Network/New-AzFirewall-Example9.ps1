
$rgName = "resourceGroupName"

$fp = Get-AzFirewallPolicy -ResourceGroupName $rgName -Name "fp"

$fpId = $fp.Id

$vHub = Get-AzVirtualHub -Name "hub"

$vHubId = $vHub.Id

New-AzFirewall -Name "azFw" -ResourceGroupName $rgName -Location centralus -SkuName AZFW_Hub -VirtualHubId $vHubId -FirewallPolicyId -$fpId
