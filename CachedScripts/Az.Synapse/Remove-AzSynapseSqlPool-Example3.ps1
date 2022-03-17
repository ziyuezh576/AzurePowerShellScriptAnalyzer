
$pool = Get-AzSynapseSqlPool -WorkspaceName ContosoWorkspace -Name ContosoSqlPool

$pool | Remove-AzSynapseSqlPool
