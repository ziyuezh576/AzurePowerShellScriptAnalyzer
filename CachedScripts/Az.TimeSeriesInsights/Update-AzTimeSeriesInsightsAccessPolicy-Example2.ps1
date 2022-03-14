
$policy = Get-AzTimeSeriesInsightsAccessPolicy -EnvironmentName tsitest001 -ResourceGroupName testgroup -Name policy001

Update-AzTimeSeriesInsightsAccessPolicy -InputObject $policy -Role Contributor
