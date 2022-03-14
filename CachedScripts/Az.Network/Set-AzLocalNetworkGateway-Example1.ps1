
$lgw = Get-AzLocalNetworkGateway -Name myLocalGW -ResourceGroupName myRG

Set-AzLocalNetworkGateway -LocalNetworkGateway $lgw
