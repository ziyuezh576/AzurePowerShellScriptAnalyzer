
$schedulePolicy = Get-AzRecoveryServicesBackupSchedulePolicyObject -WorkloadType AzureFiles -BackupManagementType AzureStorage -ScheduleRunFrequency Hourly

$retentionPolicy = Get-AzRecoveryServicesBackupRetentionPolicyObject -WorkloadType AzureFiles -BackupManagementType AzureStorage -ScheduleRunFrequency Hourly

$timeZone = Get-TimeZone

$schedulePolicy.ScheduleRunTimeZone = $timeZone.Id

$startTime = Get-Date -Date "2021-12-22T06:00:00.00+00:00"

$schedulePolicy.ScheduleWindowStartTime = $startTime.ToUniversalTime()

$schedulePolicy.ScheduleInterval = 6

$schedulePolicy.ScheduleWindowDuration = 14

$retentionPolicy.DailySchedule.DurationCountInDays = 6

$policy = Get-AzRecoveryServicesBackupProtectionPolicy -Name "TestPolicy" -VaultId $vault.ID

Set-AzRecoveryServicesBackupProtectionPolicy -Policy $policy -VaultId $vault.ID -SchedulePolicy $schedulePolicy -RetentionPolicy $retentionPolicy
