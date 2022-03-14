
$oldExport = Get-AzCostManagementExport -Scope "subscriptions/*********" -Name "TestExport"

Update-AzCostManagementExport -InputObject $oldExport -ScheduleRecurrence 'Weekly'
