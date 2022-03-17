
$serviceTags = Get-AzNetworkServiceTag -Location eastus2

$serviceTags.Values | Where-Object { $_.Name -eq "Storage.WestUS2" }

$serviceTags.Values | Where-Object { $_.Name -like "Storage*" -and $_.Properties.Region -eq "westus2" }

$serviceTags.Values | Where-Object { $_.Properties.SystemService -eq "AzureStorage" -and $_.Properties.Region -eq "westus2" }
