
$pool = Get-AzSynapseSparkPool -WorkspaceName ContosoWorkspace -SparkPoolName ContosoSparkPool

$pool | Stop-AzSynapseSparkSession -LivyId 324
