
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Remove-AzSynapseWorkspacePackage -Name ContosoPackageName
