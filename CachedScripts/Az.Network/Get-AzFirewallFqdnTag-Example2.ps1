
$fqdnTags = Get-AzFirewallFqdnTag

New-AzFirewallApplicationRule -Name AR -SourceAddress * -FqdnTag $fqdnTags[0].FqdnTagName
