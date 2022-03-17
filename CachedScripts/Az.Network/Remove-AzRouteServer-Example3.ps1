
$routeServer = Get-AzRouteServer -ResourceGroupName routeServerRG -RouteServerName routeServer

Remove-AzRouteServer -InputObject $routeServer
