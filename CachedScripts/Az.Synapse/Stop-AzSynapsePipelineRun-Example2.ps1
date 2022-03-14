
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Stop-AzSynapsePipelineRun -PipelineRunId b9730a13-aa12-4926-a8b3-8e3a974ab0bd
