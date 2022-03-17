
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Remove-AzSynapseManagedPrivateEndpoint -Name ContosoManagedPrivateEndpoint
