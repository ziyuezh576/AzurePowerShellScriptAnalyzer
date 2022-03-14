
$pool = Get-AzSynapseSqlPoolGeoBackup -ResourceGroupName ContosoResourceGroup -WorkspaceName ContosoWorkspace -Name ContosoSqlPool

$databaseId = $pool.Id -replace "Microsoft.Synapse", "Microsoft.Sql" `
-replace "workspaces", "servers"

$restoredPool = Restore-AzSynapseSqlPool -FromBackup -TargetSqlPoolName ContosoRestoredSqlPool -ResourceGroupName $pool.ResourceGroupName -WorkspaceName $pool.WorkspaceName -ResourceId $databaseId
