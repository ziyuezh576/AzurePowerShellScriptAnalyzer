
$tags = @{ NewTag = "NewTagValue"}

Update-AzConnectedNetworkDeviceTag -DeviceName "myMecDevice" -ResourceGroupName "myResources" -Tag $tags
