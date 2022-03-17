
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Add-AzSynapseTriggerSubscription -Name ContosoTrigger
