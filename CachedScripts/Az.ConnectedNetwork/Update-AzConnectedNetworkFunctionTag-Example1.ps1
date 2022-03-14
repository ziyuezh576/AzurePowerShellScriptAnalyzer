
$tags = @{ NewTag = "NewTagValue"}

Update-AzConnectedNetworkFunctionTag -NetworkFunctionName myNewVnf1 -ResourceGroupName myResources -Tag $tags
