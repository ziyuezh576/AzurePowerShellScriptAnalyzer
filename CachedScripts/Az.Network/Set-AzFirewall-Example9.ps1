
$dnsServers = @("10.10.10.1", "20.20.20.2")

$azFw = Get-AzFirewall -Name "AzureFirewall" -ResourceGroupName "rg"

$azFw.DNSEnableProxy = $true

$azFw.DNSServer = $dnsServers

$azFw | Set-AzFirewall
