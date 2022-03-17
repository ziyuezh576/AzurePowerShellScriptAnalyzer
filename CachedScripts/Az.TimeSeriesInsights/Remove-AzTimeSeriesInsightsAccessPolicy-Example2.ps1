
$policy = Get-AzTimeSeriesInsightsAccessPolicy -EnvironmentName tsitest001 -Name policy001 -ResourceGroupName testgroup

Remove-AzTimeSeriesInsightsAccessPolicy -InputObject $policy
