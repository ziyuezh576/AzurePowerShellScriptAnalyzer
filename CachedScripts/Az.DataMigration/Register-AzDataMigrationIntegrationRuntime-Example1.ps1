
$authKeys = Get-AzDataMigrationSqlMigrationServiceAuthKey -ResourceGroupName "MyResourceGroup" -SqlMigrationServiceName "MySqlMigrationService"

Register-AzDataMigrationIntegrationRuntime -AuthKey $authKeys.AuthKey1
