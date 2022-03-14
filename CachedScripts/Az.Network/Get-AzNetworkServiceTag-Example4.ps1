
$serviceTags = Get-AzNetworkServiceTag -Location eastus2

$serviceTags.Values | Where-Object { -not $_.Properties.Region }
