
$env = Get-AzTimeSeriesInsightsEnvironment -ResourceGroupName testgroup -Name tsill

Remove-AzTimeSeriesInsightsEnvironment -InputObject $env
