
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Export-AzSynapseSparkConfiguration -Name ContoSparkConfiguration -OutputFolder "C:\SparkConfiguration"
