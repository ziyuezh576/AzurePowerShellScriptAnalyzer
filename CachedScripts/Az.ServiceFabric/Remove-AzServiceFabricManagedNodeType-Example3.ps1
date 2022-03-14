
$rgName = "testRG"

$clusterName = "testCluster"

$NodeTypeName = "nt1"

Remove-AzServiceFabricManagedNodeType -ResourceGroupName $rgName -ClusterName $clusterName  -Name $NodeTypeName -NodeName nt1_0, nt1_3
