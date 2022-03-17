
$ckt = Get-AzExpressRouteCircuit -Name $CircuitName -ResourceGroupName $rg

$ckt.ServiceKey = '64ce99dd-ee70-4e74-b6b8-91c6307433a0'

Set-AzExpressRouteCircuit -ExpressRouteCircuit $ckt
