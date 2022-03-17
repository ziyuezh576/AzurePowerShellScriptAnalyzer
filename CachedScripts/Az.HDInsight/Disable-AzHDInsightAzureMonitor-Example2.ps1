
$clusterName = "your-hadoop-001"

$cluster=Get-AzHDInsightCluster -ClusterName $clusterName

$cluster | Disable-AzHDInsightAzureMonitor
