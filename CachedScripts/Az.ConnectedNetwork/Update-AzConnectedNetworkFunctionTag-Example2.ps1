
$tags = @{ NewTag = "NewTagValue"}

$vnf = @{ NetworkFunctionName = "myVnf1"; ResourceGroupName = "myResources"; SubscriptionId = "00000000-0000-0000-0000-000000000000"}

Update-AzConnectedNetworkFunctionTag -InputObject $vnf -Tag $tags
