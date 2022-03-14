
$schedulePolicy = Get-AzRecoveryServicesBackupSchedulePolicyObject -WorkloadType AzureFiles -BackupManagementType AzureStorage -ScheduleRunFrequency Hourly

$timeZone = Get-TimeZone

$schedulePolicy.ScheduleRunTimeZone = $timeZone.Id

$startTime = Get-Date -Date "2021-12-22T06:00:00.00+00:00"

$schedulePolicy.ScheduleWindowStartTime = $startTime.ToUniversalTime()

$schedulePolicy.ScheduleInterval = 6

$schedulePolicy.ScheduleWindowDuration = 14

$retentionPolicy = Get-AzRecoveryServicesBackupRetentionPolicyObject -WorkloadType AzureFiles -BackupManagementType AzureStorage -ScheduleRunFrequency Hourly

$retentionPolicy.DailySchedule.DurationCountInDays = 10

New-AzRecoveryServicesBackupProtectionPolicy -Name "NewPolicy" -WorkloadType AzureVM -RetentionPolicy $retentionPolicy -SchedulePolicy $schedulePolicy
