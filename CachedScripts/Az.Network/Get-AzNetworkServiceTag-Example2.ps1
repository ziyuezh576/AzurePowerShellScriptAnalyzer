
$serviceTags = Get-AzNetworkServiceTag -Location eastus2

$sql = $serviceTags.Values | Where-Object { $_.Name -eq "Sql" }

$sql

$sql.Properties.AddressPrefixes.Count

$sql.Properties.AddressPrefixes
