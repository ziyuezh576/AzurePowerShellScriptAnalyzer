
$prop = @{}

$prop.add("Location", "US")

$content = @{}

$content.add("properties.desired.Region", $prop)

Add-AzIotHubConfiguration -ResourceGroupName "myresourcegroup" -IotHubName "myiothub" -Name "config1" -DeviceContent $content
