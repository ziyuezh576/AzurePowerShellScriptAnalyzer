
$ID = "/subscriptions/<SubscriptionId>/resourceGroups/mariadb-test-qu5ov0/providers/Microsoft.DBforMariaDB/servers/mariadb-test-4rmtig/firewallRules/fr-cfgl3y"

Update-AzMariaDbFirewallRule -InputObject $ID --ClientIPAddress 0.0.0.2

fr-cfgl3y 0.0.0.2        0.0.0.2
