
$sparkConfiguration = Get-AzSynapseSparkConfiguration -WorkspaceName ContosoWorkspace -Name ContosoSparkConfiguration

$sparkConfiguration | Remove-AzSynapseSparkConfiguration
