
$privateendpint = Get-AzSynapseManagedPrivateEndpoint -WorkspaceName ContosoWorkspace -Name ContosoManagedPrivateEndpoint

$privateendpint | Remove-AzSynapseManagedPrivateEndpoint
