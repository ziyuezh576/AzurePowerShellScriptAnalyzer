
$primaryServer = Get-AzSqlServer -ResourceGroupName rg -ServerName primaryserver

$failoverGroup = $primaryServer | Add-AzSqlDatabaseToFailoverGroup -FailoverGroupName fg -Database ($primaryServer | Get-AzSqlDatabase)
