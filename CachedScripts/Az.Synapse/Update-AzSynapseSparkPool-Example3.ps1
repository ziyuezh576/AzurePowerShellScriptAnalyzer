
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Update-AzSynapseSparkPool -Name ContosoSparkPool -Tag @{"key" = "value2"}
