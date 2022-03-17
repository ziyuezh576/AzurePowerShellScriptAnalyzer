
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Get-AzSynapseManagedPrivateEndpoint -Name ContosoManagedPrivateEndpoint
