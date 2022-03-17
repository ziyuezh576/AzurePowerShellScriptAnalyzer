
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Set-AzSynapseTrigger -Name ContosoTrigger -DefinitionFile ".\scheduledTrigger.json"
