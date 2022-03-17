
$contactDetail = New-AzEdgeOrderContactDetailsObject -ContactName "ContactName2" -EmailList $env.EmailList -Phone $env.Phone

$ShippingDetails = New-AzEdgeOrderShippingAddressObject -StreetAddress1 $env.StreetAddress1 -StateOrProvince $env.StateOrProvince -Country $env.Country -City $env.City -PostalCode $env.PostalCode -AddressType $env.AddressType

$HierarchyInformation=New-AzEdgeOrderHierarchyInformationObject -ProductFamilyName "azurestackedge" -ProductLineName "azurestackedge" -ProductName "azurestackedgegpu" -ConfigurationName "EdgeP_High"

$preference = New-AzEdgeOrderPreferencesObject -EncryptionPreference @{DoubleEncryptionStatus = "Disabled"} -TransportPreference @{PreferredShipmentType = "MicrosoftManaged"} -ManagementResourcePreference @{PreferredManagementResourceId = "/subscriptions/managementSubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.DataBoxEdge/DataBoxEdgeDevices/1GPUtest"}

$details = New-AzEdgeOrderOrderItemDetailsObject -OrderItemType "Purchase"  -ProductDetail  @{"HierarchyInformation"=$HierarchyInformation} -Preference $preference

New-AzEdgeOrderItem -Name "OrderItemNameWithPref" -ResourceGroupName "resourceGroupName" -ForwardAddressContactDetail $contactDetail -Location "eastus" -OrderId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.EdgeOrder/locations/eastus/orders/pwPrefOrder" -OrderItemDetail $details -SubscriptionId $env.SubscriptionId -ForwardShippingAddress $ShippingDetails
