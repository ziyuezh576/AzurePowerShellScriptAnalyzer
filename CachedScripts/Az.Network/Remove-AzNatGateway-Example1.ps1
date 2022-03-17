
$nat = Get-AzNatGateway -ResourceGroupName "natgateway_test" -Name "nat_gateway"

Remove-AzNatGateway -InputObject $nat

Remove-AzNatGateway -ResourceId "/subscriptions/<subid>/resourceGroups/natgateway_test/providers/Microsoft.Network/natGateways/natgateway"
