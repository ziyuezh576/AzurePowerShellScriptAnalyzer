
$rf = Get-AzRouteFilter -Name "RouteFilter01" -ResourceGroupName "ResourceGroup01"

Remove-AzRouteFilterRuleConfig -RouteFilter $rf -Name "Rule01"
