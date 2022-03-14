
$rgName = "testRG"

$clusterName = "testCluster"

$NodeTypeName = "nt1"

Remove-AzServiceFabricManagedNodeTypeVMExtension -ResourceGroupName $rgName -ClusterName $clusterName -NodeTypeName $NodeTypeName -Name MyExtensionName
