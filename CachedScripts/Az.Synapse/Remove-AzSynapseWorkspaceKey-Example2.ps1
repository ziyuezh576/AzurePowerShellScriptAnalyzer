
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Remove-AzSynapseWorkspaceKey -Name ContosoKeyName
