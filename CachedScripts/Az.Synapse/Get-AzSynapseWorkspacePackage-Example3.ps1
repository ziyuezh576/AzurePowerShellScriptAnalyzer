
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Get-AzSynapseWorkspacePackage -Name ContosoWorkspacePackage
