
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Remove-AzSynapseSparkJobDefinition -Name ContosoSparkJobDefinition
