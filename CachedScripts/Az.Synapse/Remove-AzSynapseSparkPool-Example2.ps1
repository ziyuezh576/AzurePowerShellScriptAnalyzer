
$pool = Get-AzSynapseSparkPool -WorkspaceName ContosoWorkspace -Name ContosoSparkPool

$pool | Remove-AzSynapseSparkPool
