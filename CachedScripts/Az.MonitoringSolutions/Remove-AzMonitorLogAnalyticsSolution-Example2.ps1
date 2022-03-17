
$monitor = Get-AzMonitorLogAnalyticsSolution -ResourceGroupName azureps-manual-test -Name 'Containers(monitoringworkspace-pevful)'

Remove-AzMonitorLogAnalyticsSolution -InputObject $monitor
