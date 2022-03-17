
$getExport = Get-AzCostManagementExport -Scope 'subscriptions/*********' -name 'TestExportDatasetAggregationYouori'

Remove-AzCostManagementExport -InputObject $getExport
