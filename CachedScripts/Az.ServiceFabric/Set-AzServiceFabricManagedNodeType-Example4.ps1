
$rgName = "testRG"

$clusterName = "testCluster"

$NodeTypeName = "nt1"

$nodeType = Get-AzServiceFabricManagedNodeType -ResourceGroupName $rgName -ClusterName $clusterName -Name $NodeTypeName

$nodeType.VmInstanceCount = 6

$nodeType | Set-AzServiceFabricManagedNodeType
