
$newTags = @{new="tags"}

$packageUrl = "https://sftestapp.blob.core.windows.net/sftestapp/testAppType_v1.sfpkg"

$resourceId = "/subscriptions/13ad2c84-84fa-4798-ad71-e70c07af873f/resourcegroups/testRG/providers/Microsoft.ServiceFabric/managedClusters/testCluster/applicationTypes/testAppType/versions/v1"

Set-AzServiceFabricManagedClusterApplicationTypeVersion -ResourceId $resourceId -Tags $newTags -PackageUrl $packageUrl -Verbose
