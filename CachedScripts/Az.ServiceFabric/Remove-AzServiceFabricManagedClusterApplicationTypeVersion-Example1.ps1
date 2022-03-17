
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appTypeName = "testAppType"

$version = "v1"

Remove-AzServiceFabricManagedClusterApplicationTypeVersion -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appTypeName -Version $version -Force -PassThru -Verbose
