
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Update-AzSynapseSqlPool -Name ContosoSqlPool -Tag @{'key'='value1'}
