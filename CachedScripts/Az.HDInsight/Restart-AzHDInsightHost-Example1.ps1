
$clusterName = "your-hadoop-001"

Restart-AzHDInsightHost -ClusterName $clusterName -Name wn0, wn1
