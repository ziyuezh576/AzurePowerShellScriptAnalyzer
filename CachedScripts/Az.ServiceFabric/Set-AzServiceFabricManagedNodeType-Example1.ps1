
$rgName = "testRG"

$clusterName = "testCluster"

$NodeTypeName = "nt1"

Set-AzServiceFabricManagedNodeType -ResourceGroupName $rgName -ClusterName $clusterName -name $NodeTypeName -InstanceCount 6 -Verbose
