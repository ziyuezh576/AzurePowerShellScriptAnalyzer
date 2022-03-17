
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Get-AzSynapseTriggerSubscriptionStatus -Name ContosoTrigger
