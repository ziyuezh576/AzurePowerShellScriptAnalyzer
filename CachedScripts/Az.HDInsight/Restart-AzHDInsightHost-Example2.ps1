
$clusterName = "your-hadoop-001"

$worknode1= Get-AzHDInsightHost -ClusterName $clusterName | Where-Object {$_.Name -like "wn1*"}

$worknode1 | Restart-AzHDInsightHost -ClusterName $clusterName
