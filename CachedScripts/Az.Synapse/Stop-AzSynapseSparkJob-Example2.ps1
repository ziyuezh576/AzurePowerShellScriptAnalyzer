
$pool = Get-AzSynapseSparkPool -WorkspaceName ContosoWorkspace -Name ContosoSparkPool

$pool | Stop-AzSynapseSparkJob -LivyId 130
