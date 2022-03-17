
$sqlscript = Get-AzSynapseSqlScript -WorkspaceName ContosoWorkspace -Name ContosoSqlScript

$sqlscript | Remove-AzSynapseSqlScript
