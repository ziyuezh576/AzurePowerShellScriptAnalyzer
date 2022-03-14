
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Start-AzSynapseIntegrationRuntime -Name 'test-dedicated-ir'
