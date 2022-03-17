
$contactDetail = New-AzEdgeOrderContactDetailsObject -ContactName "ContactName2" -EmailList @("emailId") -Phone Phone

$DebugPreference = "Continue"

$updatedOrderItem = Update-AzEdgeOrderItem -Name "examplePowershell" -ResourceGroupName "resourceGroupName" -SubscriptionId SubscriptionId -ForwardAddressContactDetail $contactDetail

$updatedOrderItem.ForwardAddressContactDetail | fl
