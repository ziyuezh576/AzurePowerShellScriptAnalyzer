
$notebook = Get-AzSynapseNotebook -WorkspaceName ContosoWorkspace -Name ContosoNotebook

$notebook | Export-AzSynapseNotebook -OutputFolder "C:\Notebook"
