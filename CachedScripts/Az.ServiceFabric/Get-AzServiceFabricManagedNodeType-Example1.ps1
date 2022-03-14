
$rgName = "testRG"

$clusterName = "testCluster"

$NodeTypeName = "nt1"

Get-AzServiceFabricManagedNodeType -ResourceGroupName $rgName -ClusterName $clusterName -Name $NodeTypeName
