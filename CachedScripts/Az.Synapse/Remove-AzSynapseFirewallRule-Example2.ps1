
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Remove-AzSynapseFirewallRule -Name ContosoFirewallRule
