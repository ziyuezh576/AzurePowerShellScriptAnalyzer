
$cc = Get-AzExpressRouteCrossConnection -Name $CrossConnectionName -ResourceGroupName $rg

$parameters = @{

Add-AzExpressRouteCrossConnectionPeering @parameters

Set-AzExpressRouteCrossConnection -ExpressRouteCrossConnection $cc
