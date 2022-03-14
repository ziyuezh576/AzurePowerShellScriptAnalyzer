
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Update-AzSynapseFirewallRule -Name ContosoFirewallRule -StartIpAddress "0.0.0.0" -EndIpAssdress "255.255.255.255"
