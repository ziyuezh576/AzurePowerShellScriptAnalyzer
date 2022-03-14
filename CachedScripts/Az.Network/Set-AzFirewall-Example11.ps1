
$azFw = Get-AzFirewall -Name "AzureFirewall" -ResourceGroupName "rg"

$azFw.AllowActiveFTP = $true

$azFw | Set-AzFirewall
