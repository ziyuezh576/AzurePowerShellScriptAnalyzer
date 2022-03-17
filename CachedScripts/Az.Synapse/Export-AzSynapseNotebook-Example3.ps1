
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Export-AzSynapseNotebook -Name ContosoNotebook -OutputFolder "C:\Notebook"
