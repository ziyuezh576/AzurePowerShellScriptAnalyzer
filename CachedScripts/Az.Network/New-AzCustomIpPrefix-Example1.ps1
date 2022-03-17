
$myCustomIpPrefix = New-AzCustomIpPrefix -Name $prefixName -ResourceGroupName $rgName -Cidr 40.40.40.0/24 -Location westus -SignedMessage signedMessage -AuthorizationMessage authorizationMessage
