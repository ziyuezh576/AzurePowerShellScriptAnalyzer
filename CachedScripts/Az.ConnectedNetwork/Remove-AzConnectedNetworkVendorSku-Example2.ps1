
$sku = Get-AzConnectedNetworkVendorSku -SkuName MySku1 -VendorName MyVendor

Remove-AzConnectedNetworkVendorSku -InputObject $sku
