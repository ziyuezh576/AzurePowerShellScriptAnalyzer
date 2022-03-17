
$clusterResourceGroupName = "Group"

$clusterName = "your-hadoop-001"

$clusterCreds = Get-Credential

$statusFolder = "tempStatusFolder/"

$query = "SHOW TABLES"

New-AzHDInsightHiveJobDefinition -StatusFolder $statusFolder `
            -Query $query `
        | Start-AzHDInsightJob -ResourceGroupName $clusterResourceGroupName `
            -ClusterName $clusterName `
            -ClusterCredential $clusterCreds `
        | Wait-AzHDInsightJob -ResourceGroupName $clusterResourceGroupName `
            -ClusterName $clusterName `
            -ClusterCredential $clusterCreds
