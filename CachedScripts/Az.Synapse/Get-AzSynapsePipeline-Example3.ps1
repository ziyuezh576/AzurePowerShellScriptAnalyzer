
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Get-AzSynapsePipeline -Name ContosoPipeline
