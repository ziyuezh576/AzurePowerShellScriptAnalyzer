
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appTypeName = "testAppType"

$appType = New-AzServiceFabricManagedClusterApplicationType -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appTypeName -Verbose
