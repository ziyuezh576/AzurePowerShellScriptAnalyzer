
$failoverGroup = Get-AzSqlDatabaseFailoverGroup -ResourceGroupName rg -ServerName primaryserver -FailoverGroupName fg

$databases = Get-AzSqlElasticPoolDatabase -ResourceGroupName rg -ServerName primaryserver -ElasticPoolName pool1

$failoverGroup = $failoverGroup | Add-AzSqlDatabaseToFailoverGroup -Database $databases
