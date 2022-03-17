
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Update-AzSynapseWorkspace -Tag @{'key'='value1'}
