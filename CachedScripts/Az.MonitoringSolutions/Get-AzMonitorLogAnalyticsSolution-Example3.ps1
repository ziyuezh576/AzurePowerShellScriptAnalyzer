
$monitor = New-AzMonitorLogAnalyticsSolution -ResourceGroupName azureps-monitor -Name 'Containers(azureps-monitor)'

Get-AzMonitorLogAnalyticsSolution -InputObject $monitor
