
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | New-AzSynapseManagedPrivateEndpoint -Name ContosoManagedPrivateEndpoint -DefinitionFile "C:\\endpoint.json"
