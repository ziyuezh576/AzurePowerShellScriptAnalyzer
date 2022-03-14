
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Get-AzSynapseSparkConfiguration -Name ContosoSparkConfiguration
