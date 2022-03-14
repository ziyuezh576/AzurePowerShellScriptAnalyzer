
$ks = Get-AzStorageAccountKey -ResourceGroupName "testgroup" -Name "staccount001"

$k  = $ks[0].Value | ConvertTo-SecureString -AsPlainText -Force

New-AzTimeSeriesInsightsEnvironment -ResourceGroupName testgroup -Name tsitest002 -Kind Gen2 -Location eastus -Sku L1 -StorageAccountName staccount001 -StorageAccountKey $k -TimeSeriesIdProperty @{name='cdc';type='string'}
