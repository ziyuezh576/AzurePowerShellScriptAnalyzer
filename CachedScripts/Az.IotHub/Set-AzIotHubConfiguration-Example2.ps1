
$labels = @{}

$labels.add("key0","value0")

$metrics = @{}

$metrics.add("query1", "select deviceId from devices where tags.location='US'")

Set-AzIotHubConfiguration -ResourceGroupName "myresourcegroup" -IotHubName "myiothub" -Name "config1" -Label $labels -Metric $metrics
