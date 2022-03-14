
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

$appTypeName = "testAppType"

$appTypeVersion = "v1"

$appParameters =  @{key0="value0";key1=$null;key2="value2"}

New-AzServiceFabricManagedClusterApplication -ResourceGroupName $resourceGroupName -ClusterName $clusterName -ApplicationTypeName $appTypeName -ApplicationTypeVersion $appTypeVersion -Name $appName -ApplicationParameter $appParameters
