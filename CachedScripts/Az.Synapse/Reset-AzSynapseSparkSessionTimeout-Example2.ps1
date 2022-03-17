
$pool = Get-AzSynapseSparkPool -WorkspaceName ContosoWorkspace -SparkPoolName ContosoSparkPool

$pool | Reset-AzSynapseSparkSessionTimeout -LivyId 125
