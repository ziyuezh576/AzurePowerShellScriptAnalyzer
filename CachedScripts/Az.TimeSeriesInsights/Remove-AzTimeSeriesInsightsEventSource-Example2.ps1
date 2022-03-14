
$es = Get-AzTimeSeriesInsightsEventSource -EnvironmentName tsitest001 -ResourceGroupName testgroup -Name iots001

Remove-AzTimeSeriesInsightsEventSource -InputObject $es
