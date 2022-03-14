
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Get-AzSynapseSparkJobDefinition -Name ContosoSparkJobDefinition
