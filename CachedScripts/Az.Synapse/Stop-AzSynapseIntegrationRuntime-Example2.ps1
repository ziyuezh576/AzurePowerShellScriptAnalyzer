
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Stop-AzSynapseIntegrationRuntime -Name 'test-dedicated-ir'
