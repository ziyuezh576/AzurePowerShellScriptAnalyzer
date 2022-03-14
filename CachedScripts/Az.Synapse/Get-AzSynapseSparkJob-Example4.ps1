
$pool = Get-AzSynapseSparkPool -WorkspaceName ContosoWorkspace -SparkPoolName ContosoSparkPool

$pool | Get-AzSynapseSparkJob
