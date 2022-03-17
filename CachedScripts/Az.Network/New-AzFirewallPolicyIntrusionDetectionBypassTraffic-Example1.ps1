
$bypass = New-AzFirewallPolicyIntrusionDetectionBypassTraffic -Name "bypass-setting" -Protocol "TCP" -DestinationPort "80" -SourceAddress "10.0.0.0" -DestinationAddress "*"

New-AzFirewallPolicyIntrusionDetection -Mode "Deny" -BypassTraffic $bypass
