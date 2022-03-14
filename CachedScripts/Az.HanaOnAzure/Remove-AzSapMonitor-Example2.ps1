
$sap = Get-AzSapMonitor -ResourceGroupName nancyc-hn1 -Name ps-sapmonitor-t01

Remove-AzSapMonitor -InputObject $sap
