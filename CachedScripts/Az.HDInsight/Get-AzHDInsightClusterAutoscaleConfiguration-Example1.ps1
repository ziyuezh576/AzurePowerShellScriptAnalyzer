
$clusterResourceGroup="group"

$clusterName="MyCluster"

Get-AzHDInsightClusterAutoscaleConfiguration -ResourceGroupName $clusterResourceGroup -ClusterName $clusterName
