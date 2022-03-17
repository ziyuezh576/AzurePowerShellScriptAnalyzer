
New-AzCosmosDBAccount -ResourceGroupName resourceGroupName -Name restored-account-name  -Location "West US" -FromPointInTimeBackup -SourceDatabaseAccountName source-database-account-name -RestoreTimesampInUtc 2020-07-20T17:19:25+0000
