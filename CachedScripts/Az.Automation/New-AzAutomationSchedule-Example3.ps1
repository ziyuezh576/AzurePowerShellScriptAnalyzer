
$StartTime = Get-Date "13:00:00"

$EndTime = $StartTime.AddYears(1)

New-AzAutomationSchedule -AutomationAccountName "Contoso17" -Name "Schedule02" -StartTime $StartTime -ExpiryTime $EndTime -DayInterval 1 -ResourceGroupName "ResourceGroup01"
