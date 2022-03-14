
$trigger = Get-AzSynapseTrigger -WorkspaceName ContosoWorkspace -Name ContosoTrigger

$trigger | Start-AzSynapseTrigger
