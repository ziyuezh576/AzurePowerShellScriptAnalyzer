
$ipconf1 = New-AzConnectedNetworkInterfaceIPConfigurationObject -IPAllocationMethod "Dynamic" -IPVersion "IPv4"

$ipconf2 = New-AzConnectedNetworkInterfaceIPConfigurationObject -IPAllocationMethod "Dynamic" -IPVersion "IPv4"

$ip1 = New-AzConnectedNetworkInterfaceObject -IPConfiguration $ipconf1 -Name "mrmmanagementnic1" -VMSwitchType "Management"

$ip2 = New-AzConnectedNetworkInterfaceObject -IPConfiguration $ipconf2 -Name "mrmlannic1" -VMSwitchType "Lan"

$userconfig2 = New-AzConnectedNetworkFunctionUserConfigurationObject -NetworkInterface $ip1,$ip2 -RoleName "hpehss"

$vnf1 = New-AzConnectedNetworkFunction -Name vnftest11 -DeviceId /subscriptions/xxxxx-00000-xxxxx-00000/resourceGroups/myResources/providers/Microsoft.HybridNetwork/devices/mec_autotest_01 -ResourceGroupName myResources -SubscriptionId xxxxx-00000-xxxxx-00000 -Location eastus2euap -SkuName staticSku -VendorName hssvendor01 -UserConfiguration $userconfig2 -verbose

$v2.ServiceKey
