
$primaryServer = Get-AzSqlServer -ResourceGroupName rg -ServerName primaryserver

$failoverGroup = $primaryServer | Remove-AzSqlDatabaseFromFailoverGroup -FailoverGroupName fg -Database ($primaryServer | Get-AzSqlDatabase)
