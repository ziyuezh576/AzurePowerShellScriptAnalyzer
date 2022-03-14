
$TimeZone = "Europe/Paris"

New-AzAutomationSchedule -AutomationAccountName "Contoso17" -Name "Schedule01" -StartTime "23:00Z" -OneTime -ResourceGroupName "ResourceGroup01" -TimeZone $TimeZone
