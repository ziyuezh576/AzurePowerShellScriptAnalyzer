
$trigger = Get-AzSynapseTrigger -WorkspaceName ContosoWorkspace -Name ContosoTrigger

$trigger | Stop-AzSynapseTrigger
