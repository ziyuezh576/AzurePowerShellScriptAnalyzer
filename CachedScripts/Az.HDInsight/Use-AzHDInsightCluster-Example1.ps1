
$clusterName = "your-hadoop-001"

$clusterCreds = Get-Credential

Use-AzHDInsightCluster `
            -ClusterName $clusterName `
            -ClusterCredential $clusterCreds
