
$existingHub = Get-AzVirtualHub -ResourceGroupName "testRg" -Name "westushub"

$route1 = Add-AzVirtualHubRoute -DestinationType "CIDR" -Destination @("10.4.0.0/16", "10.5.0.0/16") -NextHopType "IPAddress" -NextHop @("10.0.0.68")

$routeTable1 = Add-AzVirtualHubRouteTable -Route @($route1) -Connection @("All_Vnets") -Name "routeTable1"

Set-AzVirtualHub -VirtualHub $existingHub -RouteTable @($routeTable1)
