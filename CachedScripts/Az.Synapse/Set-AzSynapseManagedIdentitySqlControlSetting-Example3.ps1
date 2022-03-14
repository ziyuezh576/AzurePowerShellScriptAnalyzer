
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Set-AzSynapseManagedIdentitySqlControlSetting -Enabled $true
