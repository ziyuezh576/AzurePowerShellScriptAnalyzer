
$TimeSpan = New-TimeSpan -Days 1 -Hours 1 -Minutes 25

New-AzTimeSeriesInsightsEnvironment -ResourceGroupName testgroup -Name tsitest001 -Kind Gen1 -Location eastus -Sku S1 -DataRetentionTime $TimeSpan -Capacity 2
