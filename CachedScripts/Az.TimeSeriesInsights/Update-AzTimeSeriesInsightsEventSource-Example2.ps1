
$es = Get-AzTimeSeriesInsightsEventSource -EnvironmentName tsitest001 -ResourceGroupName testgroup -Name iots001

Update-AzTimeSeriesInsightsEventSource -InputObject $es -Tag @{"tgb"="002"}
