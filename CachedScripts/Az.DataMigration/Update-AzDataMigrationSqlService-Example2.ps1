
$mySqlMS = Get-AzDataMigrationSqlService -ResourceGroupName "MyResourceGroup" -SqlMigrationServiceName "MySqlMigrationService"

Update-AzDataMigrationSqlService -InputObject $mySqlMS -Tag @{Tag="Service"}
