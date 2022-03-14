
$circuit = Get-AzExpressRouteCircuit -Name $CircuitName -ResourceGroupName $rg

$parameters = @{

Set-AzExpressRouteCircuitPeeringConfig @parameters

Set-AzExpressRouteCircuit -ExpressRouteCircuit $circuit
