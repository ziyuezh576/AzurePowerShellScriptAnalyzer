
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | New-AzSynapseSparkPool -Name ContosoSparkPool -NodeCount 3 -SparkVersion 2.4 -NodeSize Small
