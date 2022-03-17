
$sparkConfiguration = Get-AzSynapseSparkConfiguration -WorkspaceName ContosoWorkspace -Name ContoSparkConfiguration

$sparkConfiguration | Export-AzSynapseSparkConfiguration -OutputFolder "C:\SparkConfiguration"
