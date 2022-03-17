
$instancePool = Get-AzSqlInstancePool -ResourceGroupName resourcegroup01 -Name instancePool0

Set-AzSqlInstancePool -InputObject $instancePool -LicenseType LicenseIncluded
