
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

Set-AzServiceFabricManagedClusterApplication -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appName -FailureAction Rollback -ForceRestart:$false -Verbose
