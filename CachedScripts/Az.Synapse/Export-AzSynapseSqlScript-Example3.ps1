
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Export-AzSynapseSqlScript -Name ContosoSqlScript -OutputFolder "C:\sqlscript"
