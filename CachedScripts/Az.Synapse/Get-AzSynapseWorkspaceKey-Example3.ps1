
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Get-AzSynapseWorkspaceKey -Name ContosoWorkspaceKey
