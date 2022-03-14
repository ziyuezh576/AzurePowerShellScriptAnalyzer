
$appgw = Get-AzApplicationGateway -Name $appgwName -ResourceGroupName $rgName

$identity = New-AzUserAssignedIdentity -Name $identityName -ResourceGroupName $rgName -Location $location

$appgwIdentity = Set-AzApplicationGatewayIdentity -UserAssignedIdentity $identity.Id -ApplicationGateway $appgw

$updatedAppGw = Set-AzApplicationGateway -ApplicationGateway $appgw
