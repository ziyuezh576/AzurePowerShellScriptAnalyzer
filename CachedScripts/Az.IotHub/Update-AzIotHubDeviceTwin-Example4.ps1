
$updatedTag = @{}

$updatedTag.add("key0","value0")

$updatedDesired =@{}

$updatedDesired.add("desiredkey","desiredvalue")

Update-AzIotHubDeviceTwin -ResourceGroupName "myresourcegroup" -IotHubName "myiothub" -DeviceId "myDevice1" -Tag $updatedTag -Desired $updatedDesired
