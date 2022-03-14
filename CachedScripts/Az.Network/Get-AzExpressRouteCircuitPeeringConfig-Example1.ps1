
$ckt = Get-AzExpressRouteCircuit -Name $CircuitName -ResourceGroupName $RG

Get-AzExpressRouteCircuitPeeringConfig -Name "AzurePrivatePeering" -ExpressRouteCircuit $ckt
