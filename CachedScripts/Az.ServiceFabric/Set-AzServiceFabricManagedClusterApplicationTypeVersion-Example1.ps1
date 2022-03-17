
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appTypeName = "testAppType"

$version = "v1"

$newTags = @{new="tags"}

$packageUrl = "https://sftestapp.blob.core.windows.net/sftestapp/testAppType_v1.sfpkg"

Set-AzServiceFabricManagedClusterApplicationTypeVersion -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appTypeName -Version $version -Tags $newTags -PackageUrl $packageUrl -Verbose
