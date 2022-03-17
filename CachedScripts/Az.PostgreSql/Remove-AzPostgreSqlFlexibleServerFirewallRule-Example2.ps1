
$ID = "/subscriptions/<SubscriptionId>/resourceGroups/PowershellPostgreSqlTest/providers/Microsoft.DBforPostgreSQL/flexibleServers/postgresql-test/firewallRules/firewall-rule-test"

Remove-AzPostgreSqlFlexibleServerFirewallRule -InputObject $ID
