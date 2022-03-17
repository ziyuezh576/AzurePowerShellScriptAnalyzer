
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Set-AzSynapseNotebook -DefinitionFile "C:\\samples\\notebook.ipynb"
