
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

Get-AzServiceFabricApplication -ResourceGroupName $resourceGroupName -ClusterName $clusterName -ApplicationName $appName
