
$rgName = "testRG"

$clusterName = "testCluster"

$NodeTypeName = "nt1"

Set-AzServiceFabricManagedNodeType -ResourceGroupName $rgName -ClusterName $clusterName  -Name $NodeTypeName -Reimage -NodeName nt1_0, nt1_3
