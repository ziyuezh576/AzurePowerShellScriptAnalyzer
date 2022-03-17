
$instancePool = Get-AzSqlInstancePool -ResourceGroupName resourcegroup01 -Name instancepool0

Get-AzSqlInstancePoolUsage -InstancePool $instancePool
