
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

Remove-AzServiceFabricManagedClusterApplication -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appName
