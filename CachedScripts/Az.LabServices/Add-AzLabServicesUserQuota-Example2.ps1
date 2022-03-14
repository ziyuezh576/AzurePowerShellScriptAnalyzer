
$user = Get-AzLabUser -ResourceGroupName "group name" -LabName "lab name" -UserName 'ContosoUser12345'

$user | Add-AzLabUserQuota -UsageQuotaToAddToExisting $(New-Timespan -Hours 5)
