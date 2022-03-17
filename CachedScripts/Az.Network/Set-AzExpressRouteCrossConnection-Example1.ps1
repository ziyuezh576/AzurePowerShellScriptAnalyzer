
$cc = Get-AzExpressRouteCrossConnection -Name $CrossConnectionName -ResourceGroupName $rg

$cc.ServiceProviderProvisioningState = 'Provisioned'

Set-AzExpressRouteCrossConnection -ExpressRouteCrossConnection $cc
