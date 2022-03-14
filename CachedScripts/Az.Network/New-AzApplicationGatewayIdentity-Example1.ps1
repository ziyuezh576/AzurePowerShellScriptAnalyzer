
$identity = New-AzUserAssignedIdentity -Name $identityName -ResourceGroupName $rgName -Location $location

$appgwIdentity = New-AzApplicationGatewayIdentity -UserAssignedIdentity $identity.Id

$gateway = New-AzApplicationGateway -Name "AppGateway01" -ResourceGroupName "ResourceGroup01" -Location "West US" -Identity $appgwIdentity <..>
