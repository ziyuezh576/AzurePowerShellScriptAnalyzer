
$vmMigration = Get-AzDataMigrationToSqlVM -ResourceGroupName "MyResourceGroup" -SqlVirtualMachineName "MySqlVM" -TargetDbName "MyDatabase"

Invoke-AzDataMigrationCutoverToSqlVM -ResourceGroupName "MyResourceGroup" -SqlVirtualMachineName "MySqlVM" -TargetDbName "MyDatabase" -MigrationOperationId $vmMigration.MigrationOperationId

Get-AzDataMigrationToSqlVM -InputObject $vmMigration
