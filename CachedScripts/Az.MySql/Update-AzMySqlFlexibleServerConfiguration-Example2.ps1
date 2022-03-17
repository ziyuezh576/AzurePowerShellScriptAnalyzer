
$ID = "/subscriptions/<SubscriptionId>/resourceGroups/PowershellMySqlTest/providers/Microsoft.DBForMySql/flexibleServers/mysql-test/configurations/wait_timeout"

Update-AzMySqlFlexibleServerConfiguration -InputObject $ID -Value 150
