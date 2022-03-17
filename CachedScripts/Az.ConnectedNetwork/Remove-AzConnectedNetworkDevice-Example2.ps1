
$mecDevice = Get-AzConnectedNetworkDevice -Name myMecDevice2 -ResourceGroupName myResources

Remove-AzConnectedNetworkDevice -InputObject $mecDevice
