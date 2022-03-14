
Get-AzSqlInstancePool -ResourceGroup resourcegroup01 -Name instancePool0

Remove-AzSqlInstancePool -InputObject $instancePool
