
$getExport = Get-AzCostManagementExport -Name 'TestExport' -Scope 'subscriptions/**********'

Invoke-AzCostManagementExecuteExport -InputObject $getExport
