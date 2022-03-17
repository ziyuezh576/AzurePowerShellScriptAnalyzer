
$ipGroup = Get-AzIpGroup -ResourceGroupName ipGroupRG -Name ipGroup

$ipGroup.IpAddresses.Add("11.11.0.0/24")

Set-AzIpGroup -IpGroup $ipGroup
