
$session = Get-AzSynapseSparkSession -WorkspaceName ContosoWorkspace -SparkPoolName ContosoSparkPool -LivyId 125

$session | Reset-AzSynapseSparkSessionTimeout
