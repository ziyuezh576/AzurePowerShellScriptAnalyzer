
$notebook = Get-AzSynapseNotebook -WorkspaceName ContosoWorkspace -Name ContosoNotebook

$notebook | Remove-AzSynapseNotebook
