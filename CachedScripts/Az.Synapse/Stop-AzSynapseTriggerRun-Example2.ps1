
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Stop-AzSynapseTriggerRun -Name ContosoTrigger -TriggerRunId 000111222333abc
