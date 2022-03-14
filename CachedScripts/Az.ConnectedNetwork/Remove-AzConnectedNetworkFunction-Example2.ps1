
$vnf = Get-AzConnectedNetworkFunction -ResourceGroupName myResources -Name myVnf1

Remove-AzConnectedNetworkFunction -InputObject $vnf
