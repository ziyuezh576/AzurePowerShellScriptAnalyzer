
$circuit = Get-AzExpressRouteCircuit -Name $CircuitName -ResourceGroupName $rg

$parameters = @{

Add-AzExpressRouteCircuitPeeringConfig @parameters

Set-AzExpressRouteCircuit -ExpressRouteCircuit $circuit
