
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appTypeName = "testAppType"

Get-AzServiceFabricApplicationType -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appTypeName
