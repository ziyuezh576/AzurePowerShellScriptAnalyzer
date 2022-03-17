
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Remove-AzSynapseSparkPool -Name ContosoSparkPool
