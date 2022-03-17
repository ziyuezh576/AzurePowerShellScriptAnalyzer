
$clusterName = "your-hadoop-001"

$cluster=Get-AzHDInsightCluster -ClusterName $clusterName

$workspaceId = "your-workspace-id"

$primaryKey = "your-primary-key"

$cluster | Enable-AzHDInsightAzureMonitor -WorkspaceId $workspaceId -PrimaryKey $primaryKey
