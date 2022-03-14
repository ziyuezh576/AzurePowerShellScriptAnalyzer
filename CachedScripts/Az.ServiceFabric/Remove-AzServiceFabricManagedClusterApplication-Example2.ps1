
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

$app = Get-AzServiceFabricManagedClusterApplication -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appName

$app | Remove-AzServiceFabricManagedClusterApplication
