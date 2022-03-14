
$clusterName = "your-hadoop-001"

$clusterCreds = Get-Credential

Set-AzHDInsightGatewayCredential `
            -ClusterName $clusterName `
            -HttpCredential $clusterCreds
