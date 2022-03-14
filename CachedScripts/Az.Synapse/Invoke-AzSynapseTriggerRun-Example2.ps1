
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Invoke-AzSynapseTriggerRun -Name ContosoTrigger -TriggerRunId 000111222333abc
