
$ID = "/subscriptions/<SubscriptionId>/resourceGroups/PowershellMySqlTest/providers/Microsoft.DBforMySQL/servers/mysql-test/firewallRules/rule"

Update-AzMySqlFirewallRule -InputObject $ID --ClientIPAddress 0.0.0.2
