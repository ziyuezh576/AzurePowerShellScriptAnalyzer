
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appTypeName = "testAppType"

Get-AzServiceFabricApplicationTypeVersion -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appTypeName
