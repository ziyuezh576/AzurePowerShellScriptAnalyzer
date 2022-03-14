
$exrPort = Get-AzExpressRoutePort -Name $exrPortName -ResourceGroupName $resgpName

$identity = Get-AzExpressRoutePortIdentity -ExpressRoutePort $exrPort
