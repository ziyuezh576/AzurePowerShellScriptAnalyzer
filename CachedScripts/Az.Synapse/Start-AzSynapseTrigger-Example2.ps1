
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Start-AzSynapseTrigger -Name ContosoTrigger
