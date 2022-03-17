
$metrics = @{}

$metrics.add("query1", "select deviceId from devices where tags.location='US'")

Add-AzIotHubDeployment -ResourceGroupName "myresourcegroup" -IotHubName "myiothub" -Name "deploy1" -Metric $metrics
