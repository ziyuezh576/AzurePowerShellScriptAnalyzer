
$labels = @{}

$labels.add("key0","value0")

$metrics = @{}

$metrics.add("query1", "select deviceId from devices where tags.location='US'")

Set-AzIotHubDeployment -ResourceGroupName "myresourcegroup" -IotHubName "myiothub" -Name "deploy1" -Label $labels -Metric $metrics
