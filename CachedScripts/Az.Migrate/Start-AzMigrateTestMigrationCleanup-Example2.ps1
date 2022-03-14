
$obj = Get-AzMigrateServerReplication -TargetObjectID $env.srsMachineId -SubscriptionId $env.srsSubscriptionId

Start-AzMigrateTestMigrationCleanup -InputObject $ob
