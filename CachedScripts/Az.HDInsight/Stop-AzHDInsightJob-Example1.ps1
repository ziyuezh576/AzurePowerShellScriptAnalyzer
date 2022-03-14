
$clusterName = "your-hadoop-001"

$clusterCreds = Get-Credential

Stop-AzHDInsightJob `
            -ClusterName $clusterName `
            -ClusterCredential $clusterCreds `
            -JobId $jobId
