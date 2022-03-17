
$gw = Get-AzApplicationGateway -Name <Name> -ResourceGroupName <ResourceGroupName>

$gw.Sku.Capacity = $null

$gw.AutoscaleConfiguration = New-AzApplicationGatewayAutoscaleConfiguration -MinCapacity 2 -MaxCapacity 4

$gw = Set-AzApplicationGateway -ApplicationGateway $gw
