
$metrics = @{}

$metrics.add("query1", "select deviceId from devices where tags.location='US'")

Add-AzIotHubConfiguration -ResourceGroupName "myresourcegroup" -IotHubName "myiothub" -Name "config1" -Metric $metrics
