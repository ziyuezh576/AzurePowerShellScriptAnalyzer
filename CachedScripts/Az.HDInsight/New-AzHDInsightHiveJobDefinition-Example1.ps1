
$clusterName = "your-hadoop-001"

$clusterCreds = Get-Credential

$statusFolder = "<status folder>"        

$query = "SHOW TABLES"

New-AzHDInsightHiveJobDefinition -StatusFolder $statusFolder `
            -Query $query `
        | Start-AzHDInsightJob `
            -ClusterName $clusterName `
            -ClusterCredential $clusterCreds
