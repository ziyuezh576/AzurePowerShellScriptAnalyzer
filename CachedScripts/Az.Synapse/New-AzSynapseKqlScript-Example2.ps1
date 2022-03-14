
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | New-AzSynapseKqlScript -DefinitionFile "C:\samples\KqlScript.kql"
