
$azFw = Get-AzFirewall -Name "AzureFirewall" -ResourceGroupName "rg"

$azFw.ThreatIntelMode = "Deny"

Set-AzFirewall -Firewall $azFw
