
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Get-AzSynapsePipelineRun -RunStartedAfter "4/2/2007 7:23:57 PM" -RunStartedBefore "4/2/2027 7:23:57 PM"
