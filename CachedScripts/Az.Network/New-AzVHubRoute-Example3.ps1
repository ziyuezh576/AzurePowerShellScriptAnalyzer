
$hub = Get-AzVirtualHub -ResourceGroupName {rgname} -Name {virtual-hub-name}

$hubVnetConn = Get-AzVirtualHubVnetConnection -ParentObject $hub -Name {connection-name}

$hubVnetConn

$staticRoute1 = New-AzStaticRoute -Name "static_route1" -AddressPrefix @("10.2.1.0/24", "10.2.3.0/24") -NextHopIpAddress "10.2.0.5"

$routingConfig = $hubVnetConn.RoutingConfiguration

$routingConfig.VnetRoutes.StaticRoutes = @($staticRoute1)

$routingConfig

Update-AzVirtualHubVnetConnection -InputObject $hubVnetConn -RoutingConfiguration $routingConfig
