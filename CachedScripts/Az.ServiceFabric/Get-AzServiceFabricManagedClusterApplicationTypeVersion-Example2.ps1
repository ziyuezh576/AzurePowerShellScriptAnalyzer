
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appTypeName = "testAppType"

Get-AzServiceFabricManagedClusterApplicationTypeVersion -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appTypeName
