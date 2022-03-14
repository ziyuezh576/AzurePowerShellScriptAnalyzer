
$obj = Get-AzActivityLogAlert -ResourceGroup "Default-activityLogAlerts" -Name "alert1"

Enable-AzActivityLogAlert -InputObject $obj
