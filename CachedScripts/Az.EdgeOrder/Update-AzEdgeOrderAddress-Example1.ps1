
$contactDetail = New-AzEdgeOrderContactDetailsObject -ContactName "ContactName2" -EmailList @("emailId") -Phone Phone

$DebugPreference = "Continue"

$updatedContactInAddress = Update-AzEdgeOrderAddress -Name "TestPwAddress" -ResourceGroupName "resourceGroupName" -SubscriptionId SubscriptionId -ContactDetail $contactDetail -ShippingAddres $ShippingDetails

$updatedContactInAddress.ContactDetail.ContactName
