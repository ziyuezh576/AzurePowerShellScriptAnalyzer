
Get-AzDatadogMonitor -ResourceGroupName azure-rg-Datadog -Name Datadog | Update-AzDatadogMonitor -Tag @{'key1'='value1'; 'key2'='value2'}
