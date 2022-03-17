
New-AzCosmosDBAccount -ResourceGroupName resourceGroupName -Name restored-account-name  -Location "West US" -FromPointInTimeBackup -RestoreSourceId /subscriptions/{subscriptionId}/providers/Microsoft.DocumentDB/restorableDatabaseAccounts/{instance-id} -RestoreTimesampInUtc 2020-07-20T17:19:25+0000
