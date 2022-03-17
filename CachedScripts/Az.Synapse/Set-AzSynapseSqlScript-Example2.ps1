
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Set-AzSynapseSqlScript -DefinitionFile "C:\\samples\\sqlscript.sql"
