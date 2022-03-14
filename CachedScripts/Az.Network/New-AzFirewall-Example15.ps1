
$rgName = "resourceGroupName"

$vHub = Get-AzVirtualHub -Name "hub"

$vHubId = $vHub.Id

$fwpips = New-AzFirewallHubPublicIpAddress -Count 2

$hubIpAddresses = New-AzFirewallHubIpAddress -PublicIPs $fwpips

$fw=New-AzFirewall -Name "azFw" -ResourceGroupName $rgName -Location westus -SkuName AZFW_Hub -HubIPAddresses $hubIpAddresses -VirtualHubId $vHubId
