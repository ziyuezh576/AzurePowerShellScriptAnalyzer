
$circuit = Get-AzExpressRouteCircuit -Name $CircuitName -ResourceGroupName $rg

Remove-AzExpressRouteCircuitPeeringConfig -Name 'AzurePrivatePeering' -ExpressRouteCircuit $circuit

Set-AzExpressRouteCircuit -ExpressRouteCircuit $circuit
