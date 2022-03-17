
$pool = Get-AzSynapseSqlPool -WorkspaceName ContosoWorkspace -Name ContosoSqlPool

$pool | Update-AzSynapseSqlPool -Tag @{'key'='value2'}
