
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appTypeName = "testAppType"

$appTypeName = "v1"

Get-AzServiceFabricApplicationTypeVersion -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appTypeName -Version
