
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

Get-AzServiceFabricManagedClusterService -ResourceGroupName $resourceGroupName -ClusterName $clusterName -ApplicationName $appName
