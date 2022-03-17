
$getExport = Get-AzCostManagementExport -Name 'TestExport' -Scope 'subscriptions/**********'

Get-AzCostManagementExportExecutionHistory -InputObject $getExport
