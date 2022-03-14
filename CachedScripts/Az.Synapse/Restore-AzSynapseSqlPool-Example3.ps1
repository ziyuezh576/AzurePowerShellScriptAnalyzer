
$pool = Get-AzSynapseDroppedSqlPool -ResourceGroupName ContosoResourceGroup -WorkspaceName ContosoWorkspace -Name ContosoSqlPool

$poolId = $pool.Id.Split(",")[0]

$poolId = $poolId -replace "restorableDroppedSqlPools", "sqlPools"

$restoredPool = Restore-AzSynapseSqlPool -FromDroppedSqlPool -DeletionDate $pool.DeletionDate -TargetSqlPoolName ContosoRestoredSqlPool -ResourceGroupName $pool.ResourceGroupName -WorkspaceName $pool.WorkspaceName -ResourceId $poolId
