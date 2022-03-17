
$clusterName = "your-hadoop-001"

$clusterCreds = Get-Credential

Get-AzHDInsightCluster -ClusterName $clusterName | Set-AzHDInsightGatewayCredential `
            -HttpCredential $clusterCreds
