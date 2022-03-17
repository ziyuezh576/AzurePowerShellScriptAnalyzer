
$rgName = "testRG"

$clusterName = "testCluster"

$NodeTypeName = "nt1"

New-AzServiceFabricManagedNodeType -ResourceGroupName $rgName -ClusterName $clusterName -Name $NodeTypeName -Primary -InstanceCount 3
