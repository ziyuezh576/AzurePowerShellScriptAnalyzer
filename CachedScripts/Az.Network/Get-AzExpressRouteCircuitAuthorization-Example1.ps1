
$Circuit = Get-AzExpressRouteCircuit -Name "ContosoCircuit" -ResourceGroupName "ContosoResourceGroup"

Get-AzExpressRouteCircuitAuthorization -Circuit $Circuit
