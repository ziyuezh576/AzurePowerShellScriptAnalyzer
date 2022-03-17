
$vmMigration = Get-AzDataMigrationToSqlVM -ResourceGroupName "MyResouceGroup" -SqlVirtualMachineName "MySqlVM" -TargetDbName "MyDatabase" -Expand MigrationStatusDetails

$vmMigration.MigrationStatusDetail
