
$clusterName = "your-hadoop-001"

$clusterCreds = Get-Credential

$statusFolder = "tempStatusFolder/"

$query = "SHOW TABLES"

New-AzHDInsightStreamingMapReduceJobDefinition -StatusFolder $statusFolder `
            -Query $query `
        | Start-AzHDInsightJob `
            -ClusterName $clusterName `
            -ClusterCredential $clusterCreds
