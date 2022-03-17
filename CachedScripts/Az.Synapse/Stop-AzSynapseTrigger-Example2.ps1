
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Stop-AzSynapseTrigger -Name ContosoTrigger
