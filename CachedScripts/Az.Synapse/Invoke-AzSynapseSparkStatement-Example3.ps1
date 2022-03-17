
$session = Start-AzSynapseSparkSession -WorkspaceName ContosoWorkspace -SparkPoolName ContosoSparkPool -Name ContosoSessionName -ExecutorCount 3 -ExecutorSize Small

$session.Language = 'Spark' 

$session | Invoke-AzSynapseSparkStatement -FilePath C:\path\to\code.sc
