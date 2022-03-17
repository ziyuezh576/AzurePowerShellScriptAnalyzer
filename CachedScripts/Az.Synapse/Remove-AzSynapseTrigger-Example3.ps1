
$trigger = Get-AzSynapseTrigger -WorkspaceName ContosoWorkspace -Name ContosoTrigger

$trigger | Remove-AzSynapseTrigger
