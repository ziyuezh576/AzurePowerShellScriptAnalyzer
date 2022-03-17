
$database = Get-AzSynapseSqlDatabase -WorkspaceName ContosoWorkspace -Name ContosoSqlDatabase

$database | Remove-AzSynapseSqlDatabase
