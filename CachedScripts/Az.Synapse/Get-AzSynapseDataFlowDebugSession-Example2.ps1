
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Get-AzSynapseDataFlowDebugSession
