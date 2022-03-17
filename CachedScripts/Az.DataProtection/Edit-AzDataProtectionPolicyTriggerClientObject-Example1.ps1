
$schedule = New-AzDataProtectionPolicyTriggerScheduleClientObject -ScheduleDays (get-date) -IntervalType Daily -IntervalCount 1

Edit-AzDataProtectionPolicyTriggerClientObject -Policy $pol -Schedule $schedule
