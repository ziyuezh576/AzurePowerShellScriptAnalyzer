
$rgName = "testRG"

$clusterName = "testCluster"

$NodeTypeName = "nt2"

Remove-AzServiceFabricManagedNodeType -ResourceGroupName $rgName -ClusterName $clusterName  -Name $NodeTypeName
