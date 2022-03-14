
$rgName = "testRG"

$clusterName = "testCluster"

$NodeTypeName = "nt2"

$nodeType = Get-AzServiceFabricManagedNodeType -ResourceGroupName $rgName -ClusterName $clusterName -Name $NodeTypeName

$nodeType | Remove-AzServiceFabricManagedNodeType
