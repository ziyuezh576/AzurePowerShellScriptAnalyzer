
$tags = @{ NewTag1 = "NewTagValue1"}

$mecDevice = @{ DeviceName = "myMecDevice1"; Location = "eastus"; ResourceGroupName = "myResources"; SubscriptionId = "xxxxx-00000-xxxxx-00000"}

Update-AzConnectedNetworkDeviceTag -InputObject $mecDevice -Tag $tags
