
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

Get-AzServiceFabricManagedClusterApplication -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appName
