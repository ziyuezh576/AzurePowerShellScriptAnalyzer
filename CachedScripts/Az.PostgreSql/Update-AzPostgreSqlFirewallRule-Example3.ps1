
$ID = "/subscriptions/<SubscriptionId>/resourceGroups/PowershellPostgreSqlTest/providers/Microsoft.DBforPostgreSQL/servers/PostgreSqlTestServer/firewallRules/rule"

Update-AzPostgreSqlFirewallRule -InputObject $ID --ClientIPAddress 0.0.0.2
