
$mysql = Get-AzMySqlServer -ResourceGroupName PowershellMySqlTest -ServerName mysql-test

New-AzMySqlReplica -Master $mysql -Replica mysql-test-replica -ResourceGroupName PowershellMySqlTest
