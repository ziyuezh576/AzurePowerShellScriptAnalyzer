
$erport = Get-AzExpressRoutePort -Name $PortName -ResourceGroupName $rg

$erport.Links[0].AdminState = 'Enabled'

Set-AzExpressRoutePort -InputObject $erport
