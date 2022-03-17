
$rgName = "testRG"

$clusterName = "testCluster"

$NodeTypeName = "nt2"

New-AzServiceFabricManagedNodeType -ResourceGroupName $rgName -ClusterName $clusterName -Name $NodeTypeName -InstanceCount 10 -DiskType Premium_LRS -VmSize "Standard_DS2" -MultiplePlacementGroup
