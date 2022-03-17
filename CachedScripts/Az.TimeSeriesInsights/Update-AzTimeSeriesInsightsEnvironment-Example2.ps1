
$env = Get-AzTimeSeriesInsightsEnvironment -ResourceGroupName testgroup -Name tsitest001

Update-AzTimeSeriesInsightsEnvironment -InputObject $env -Tag @{'key2'='val2'}
