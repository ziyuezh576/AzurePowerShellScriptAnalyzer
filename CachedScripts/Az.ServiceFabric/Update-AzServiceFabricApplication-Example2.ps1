
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

Update-AzServiceFabricApplication -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appName -MinimumNodes 1 -MaximumNodes 4 -Verbose
