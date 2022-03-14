
$clusterName = "your-hadoop-001"

$resourceGroupName = "Group"

$workspaceId = "your-workspace-id"

$primaryKey = "your-primary-key"

Enable-AzHDInsightAzureMonitor -ClusterName $clusterName -ResourceGroup $resourceGroupName -WorkspaceId $workspaceId -PrimaryKey $primaryKey
