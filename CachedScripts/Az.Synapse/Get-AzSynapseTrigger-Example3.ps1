
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Get-AzSynapseTrigger -Name ContosoTrigger
