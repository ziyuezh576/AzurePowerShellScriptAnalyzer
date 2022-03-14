
$sku = Get-AzConnectedNetworkVendorSkuPreview -SkuName mySku1 -VendorName myVendor -PreviewSubscription xxxxx-22222-xxxxx-22222

Remove-AzConnectedNetworkVendorSkuPreview -InputObject $sku
