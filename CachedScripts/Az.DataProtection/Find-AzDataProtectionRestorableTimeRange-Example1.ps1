
$startTime = (Get-Date).AddDays(-30).ToString("yyyy-MM-ddTHH:mm:ss.0000000Z")

$endTime = (Get-Date).AddDays(0).ToString("yyyy-MM-ddTHH:mm:ss.0000000Z")

$instances = Search-AzDataProtectionBackupInstanceInAzGraph -Subscription "subscriptionId" -DatasourceType AzureBlob -ResourceGroup "rgName" -Vault "vaultName"

$pointInTimeRange = Find-AzDataProtectionRestorableTimeRange -BackupInstanceName $instances[0].BackupInstanceName -ResourceGroupName "rgName" -SubscriptionId "subscriptionId"  -VaultName "vaultName" -SourceDataStoreType OperationalStore -StartTime $startTime -EndTime $endTime

$pointInTimeRange.RestorableTimeRange | fl
