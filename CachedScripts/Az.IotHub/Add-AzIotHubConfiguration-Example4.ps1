
$labels = @{}

$labels.add("key0","value0")

$labels.add("key1","value1")

Add-AzIotHubConfiguration -ResourceGroupName "myresourcegroup" -IotHubName "myiothub" -Name "config1" -Label $labels
