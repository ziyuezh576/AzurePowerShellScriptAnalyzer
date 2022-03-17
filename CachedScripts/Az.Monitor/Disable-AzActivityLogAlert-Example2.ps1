
$obj = Get-AzActivityLogAlert -ResourceGroup "Default-activityLogAlerts" -Name "alert1"

Disable-AzActivityLogAlert -InputObject $obj
