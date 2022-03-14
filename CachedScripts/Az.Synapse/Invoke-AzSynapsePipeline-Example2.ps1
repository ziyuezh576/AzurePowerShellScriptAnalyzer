
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Invoke-AzSynapsePipeline -PipelineName ContosoPipeline
