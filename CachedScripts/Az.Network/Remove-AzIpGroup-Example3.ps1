
$ipGroup = Get-AzIpGroup -ResourceGroupName ipGroupRG -Name ipGroup

Remove-AzIpGroup -IpGroup $ipGroup
