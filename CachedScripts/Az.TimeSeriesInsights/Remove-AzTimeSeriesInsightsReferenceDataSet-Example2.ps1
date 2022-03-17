
$ds = Get-AzTimeSeriesInsightsReferenceDataSet -EnvironmentName tsitest001 -Name dstest001 -ResourceGroupName testgroup

Remove-AzTimeSeriesInsightsReferenceDataSet -InputObject $ds
