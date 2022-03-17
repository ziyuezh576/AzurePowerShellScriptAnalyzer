
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appTypeName = "testAppType"

Remove-AzServiceFabricManagedClusterApplicationType -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appTypeName -Verbose
