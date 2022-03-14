
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appTypeName = "testAppType"

$version = "v1"

$appTypeVersion = Get-AzServiceFabricManagedClusterApplicationTypeVersion -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appTypeName -Version $appTypeVersion

$appTypeVersion | Remove-AzServiceFabricManagedClusterApplicationTypeVersion -Force -PassThru -Verbose
