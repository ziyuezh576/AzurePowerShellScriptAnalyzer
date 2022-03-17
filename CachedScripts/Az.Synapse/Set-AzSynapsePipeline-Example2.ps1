
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Set-AzSynapsePipeline -Name ContosoPipeline -DefinitionFile "C:\pipeline.json"
