
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Set-AzSynapseLinkedService -Name ContosoLinkedService -DefinitionFile "C:\\samples\\LinkedService.json"
