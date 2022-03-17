
$session = Start-AzSynapseSparkSession -WorkspaceName ContosoWorkspace -SparkPoolName ContosoSparkPool -Name ContosoSessionName -ExecutorCount 3 -ExecutorSize Small

$session.Language = 'Spark' 

$session | Invoke-AzSynapseSparkStatement -Code '
