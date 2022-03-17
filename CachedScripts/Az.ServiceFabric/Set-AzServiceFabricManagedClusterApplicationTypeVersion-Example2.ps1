
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appTypeName = "testAppType"

$newTags = @{new="tags"}

$packageUrl = "https://sftestapp.blob.core.windows.net/sftestapp/testAppType_v1.sfpkg"

$appType = Get-AzServiceFabricManagedClusterApplicationTypeVersion -ResourceGroupName $resourceGroupName -ClusterName $clusterName -Name $appTypeName -Version $version

$appType | Set-AzServiceFabricManagedClusterApplicationTypeVersion -Tags $newTags -PackageUrl $packageUrl -Verbose
