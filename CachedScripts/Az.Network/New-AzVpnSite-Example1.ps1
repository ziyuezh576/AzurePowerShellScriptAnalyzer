
New-AzResourceGroup -Location "East US" -Name "nonlinkSite"

$virtualWan = New-AzVirtualWan -ResourceGroupName "nonlinkSite" -Name myVirtualWAN -Location "East US"

$vpnSiteAddressSpaces = New-Object string[] 2

$vpnSiteAddressSpaces[0] = "192.168.2.0/24"

$vpnSiteAddressSpaces[1] = "192.168.3.0/24"

New-AzVpnSite -ResourceGroupName "nonlinkSite" -Name "testVpnSite" -Location "East US" -VirtualWan $virtualWan -IpAddress "1.2.3.4" -AddressSpace $vpnSiteAddressSpaces -DeviceModel "SomeDevice" -DeviceVendor "SomeDeviceVendor" -LinkSpeedInMbps "10"
