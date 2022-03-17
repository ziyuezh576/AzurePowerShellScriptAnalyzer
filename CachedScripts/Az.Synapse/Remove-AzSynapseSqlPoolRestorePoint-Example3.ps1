
$points = Get-AzSynapseSqlPoolRestorePoint -WorkspaceName ContosoWorkspace -Name ContosoSqlPool

$points[index] | Remove-AzSynapseSqlPoolRestorePoint
