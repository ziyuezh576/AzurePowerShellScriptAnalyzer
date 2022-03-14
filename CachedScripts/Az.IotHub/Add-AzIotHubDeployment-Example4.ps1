
$labels = @{}

$labels.add("key0","value0")

$labels.add("key1","value1")

Add-AzIotHubDeployment -ResourceGroupName "myresourcegroup" -IotHubName "myiothub" -Name "deploy1" -Label $labels
