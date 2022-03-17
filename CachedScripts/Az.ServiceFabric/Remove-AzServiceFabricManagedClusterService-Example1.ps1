
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

$serviceName = "testService1"

Remove-AzServiceFabricManagedClusterService -ResourceGroupName $resourceGroupName -ClusterName $clusterName -ApplicationName $appName -Name $serviceName
