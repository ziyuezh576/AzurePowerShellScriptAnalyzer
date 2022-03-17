
$pool = Get-AzSynapseSparkPool -WorkspaceName ContosoWorkspace -Name ContosoSparkPool

$pool | Get-AzSynapseSparkSession
