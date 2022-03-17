
$virtualNetwork = New-AzApiManagementVirtualNetwork -SubnetResourceId "/subscriptions/a8ff56dc-3bc7-4174-a1e8-3726ab15d0e2/resourceGroups/Api-Default-WestUS/providers/Microsoft.Network/virtualNetworks/dfVirtualNetwork/subnets/backendSubnet"

$apim = Get-AzApiManagement -ResourceGroupName "ContosoGroup" -Name "ContosoApi"

$apim.VpnType = "External"

$apim.VirtualNetwork = $virtualNetwork

Set-AzApiManagement -InputObject $apim
