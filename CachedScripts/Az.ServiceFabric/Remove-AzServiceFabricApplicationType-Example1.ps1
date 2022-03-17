
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appTypeName = "testAppType"

Remove-AzServiceFabricApplicationType -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appTypeName -Verbose
