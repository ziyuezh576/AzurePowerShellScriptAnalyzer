
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Get-AzSynapseNotebook -Name ContosoNotebook
