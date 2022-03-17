
$clusterResourceGroup="group"

$clusterName="MyCluster"

Remove-AzHDInsightClusterAutoscaleConfiguration -ResourceGroupName $clusterResourceGroup -ClusterName $clusterName
