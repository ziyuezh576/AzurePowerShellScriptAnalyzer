
$trigger = Get-AzSynapseTrigger -WorkspaceName ContosoWorkspace -Name ContosoTrigger

$trigger | Get-AzSynapseTriggerSubscriptionStatus
