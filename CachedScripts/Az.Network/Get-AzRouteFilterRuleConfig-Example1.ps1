
$rf = Get-AzRouteFilter -Name "MyRouteFilter" -ResourceGroupName "MyResourceGroup"

Get-AzRouteFilterRuleConfig -RouteFilter $rf -Name "Rule01"

Get-AzRouteFilterRuleConfig -RouteFilter $rf
