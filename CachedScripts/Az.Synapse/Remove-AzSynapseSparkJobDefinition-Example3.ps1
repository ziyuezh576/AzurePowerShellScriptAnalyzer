
$sparkJobDefinition = Get-AzSynapseSparkJobDefinition -WorkspaceName ContosoWorkspace -Name ContosoSparkJobDefinition

$sparkJobDefinition | Remove-AzSynapseSparkJobDefinition
