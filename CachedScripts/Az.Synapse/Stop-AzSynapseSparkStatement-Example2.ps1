
$session = Get-AzSynapseSparkSession -WorkspaceName ContosoWorkspace -SparkPoolName ContosoSparkPool -LivyId 130

$session | Stop-AzSynapseStatement -LivyId 3
