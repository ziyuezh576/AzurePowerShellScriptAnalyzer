
$rgName = "testRG"

$clusterName = "testCluster"

$NodeTypeName = "nt1"

Restart-AzServiceFabricManagedNodeType -ResourceGroupName $rgName -ClusterName $clusterName  -Name $NodeTypeName -NodeName nt1_0, nt1_3
