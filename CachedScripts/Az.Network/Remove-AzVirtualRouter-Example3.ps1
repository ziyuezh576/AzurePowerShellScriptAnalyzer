
$virtualRouter = Get-AzVirtualRouter -ResourceGroupName virtualRouterRG -RouterName virtualRouter

Remove-AzVirtualRouter -InputObject $virtualRouter
