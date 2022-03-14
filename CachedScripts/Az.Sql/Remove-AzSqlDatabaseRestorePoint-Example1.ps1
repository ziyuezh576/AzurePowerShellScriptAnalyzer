
$RestorePointCreationDate = Get-Date "3/11/2017 1:50:00 AM"

Remove-AzSqlDatabaseRestorePoint -ResourceGroupName "ResourceGroup01" -ServerName "Server01" -DatabaseName "Database01" -RestorePointCreationDate $RestorePointCreationDate
