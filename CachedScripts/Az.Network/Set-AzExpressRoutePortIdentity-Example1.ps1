
$exrport = Get-AzExpressRoutePort -Name $portName -ResourceGroupName $rgName

$identity = New-AzUserAssignedIdentity -Name $identityName -ResourceGroupName $rgName -Location $location

$exrPortIdentity = Set-AzExpressRoutePortIdentity -UserAssignedIdentity $identity.Id -ExpressRoutePort $exrPort

$updatedExrPort = Set-AzExpressRoutePort -ExpressRoutePort $exrPort
