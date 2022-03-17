
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Remove-AzSynapseSparkConfiguration -Name ContosoSparkConfiguration
