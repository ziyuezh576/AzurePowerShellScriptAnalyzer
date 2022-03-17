
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appTypeName = "testAppType"

$newTags = @{new="tags"}

$appType = Get-AzServiceFabricManagedClusterApplicationType -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appTypeName

$appType | Set-AzServiceFabricManagedClusterApplicationType -Tags $newTags -Verbose
