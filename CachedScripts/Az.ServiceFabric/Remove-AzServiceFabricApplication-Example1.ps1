
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

Remove-AzServiceFabricApplication -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appName
