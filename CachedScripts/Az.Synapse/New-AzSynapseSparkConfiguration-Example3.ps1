
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | New-AzSynapseSparkConfiguration -DefinitionFile "C:\\samples\\sparkconfiguration.json"
