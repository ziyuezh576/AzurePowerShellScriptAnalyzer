
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Set-AzSynapseSparkJobDefinition -Name ContosoSparkJobDefinition -DefinitionFile "C:\sparkJobDefinition.json"
