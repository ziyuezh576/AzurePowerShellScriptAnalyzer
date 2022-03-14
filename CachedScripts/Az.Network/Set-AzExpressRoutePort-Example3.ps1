
$erport = Get-AzExpressRoutePort -Name $PortName -ResourceGroupName $rg

$erport.Links[0].AdminState = 'Enabled'

$erport.SciState = 'Disabled'

Set-AzExpressRoutePort -ExpressRoutePort $erport
