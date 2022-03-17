
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Remove-AzSynapseSqlDatabase -Name ContosoSqlDatabase
