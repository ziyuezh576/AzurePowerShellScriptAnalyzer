
$pool = Get-AzSynapseSparkPool -WorkspaceName ContosoWorkspace -Name ContosoSparkPool

$pool | Update-AzSynapseSparkPool -Tag @{"key" = "value1"}
