
$vendorNF = @{ ServiceKey = "1234-abcd-4321-dcba"; VendorName = "myVendor"; LocationName = "centraluseuap"; SubscriptionId = "xxxx-3333-xxxx-3333"}

Get-AzConnectedNetworkVendorFunction -InputObject $vendorNF
