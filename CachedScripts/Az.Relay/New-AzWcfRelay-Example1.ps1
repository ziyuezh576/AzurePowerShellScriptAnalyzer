
$getWcfRelay = Get-AzWcfRelay -ResourceGroupName Default-ServiceBus-WestUS -NamespaceName TestNameSpace-Relay1 -WcfRelayName TestWCFRelay1

$GetWcfRelay.UserMetadata = "TestWCFRelay2"

$GetWcfRelay.RequiresClientAuthorization = $False

$GetWcfRelay.RelayType = "Http"

New-AzWcfRelay -ResourceGroupName Default-Storage-WestUS -Namespace TestNameSpace-Relay1 -Name TestWCFRelay2 -InputObject
