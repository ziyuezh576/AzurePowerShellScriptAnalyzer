
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

$appTypeName = "testAppType"

$appTypeVersion = "v1"

$appParameters =  @{key0="value0";key1=$null;key2="value2"}

$packageUrlV1 = "https://sftestapp.blob.core.windows.net/sftestapp/testApp_1.0.sfpkg"

New-AzServiceFabricManagedClusterApplication -ResourceGroupName $resourceGroupName -ClusterName $clusterName -ApplicationTypeName $appTypeName -ApplicationTypeVersion $appTypeVersion -Name $appName -PackageUrl $packageUrlV1 -ApplicationParameter $appParameters
