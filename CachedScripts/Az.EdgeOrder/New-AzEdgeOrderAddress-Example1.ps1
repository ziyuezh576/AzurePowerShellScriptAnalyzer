
$contactDetail = New-AzEdgeOrderContactDetailsObject -ContactName ContactName -EmailList @("emailId") -Phone Phone

$ShippingDetails = New-AzEdgeOrderShippingAddressObject -StreetAddress1 "101 TOWNSEND ST" -StateOrProvince "CA" -Country "US" -City "San Francisco" -PostalCode "94107" -AddressType "Commercial"

$DebugPreference = "Continue"

$address = New-AzEdgeOrderAddress -Name "TestPwAddress" -ResourceGroupName "resourceGroupName" -ContactDetail $contactDetail -SubscriptionId SubscriptionId -ShippingAddress $ShippingDetails -Location "eastus"

$address | fl
