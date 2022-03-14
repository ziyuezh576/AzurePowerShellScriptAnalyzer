
$rgName = "testRG"

$clusterName = "testCluster"

$NodeTypeName = "nt1"

Set-AzServiceFabricManagedNodeType -ResourceGroupName $rgName -ClusterName $clusterName -name $NodeTypeName -PlacementProperty @{NodeColor="Red";SomeProperty="6";} -Verbose
