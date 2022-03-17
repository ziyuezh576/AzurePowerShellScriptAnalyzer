
$SchPol = Get-AzRecoveryServicesBackupSchedulePolicyObject -WorkloadType "AzureVM" 

$SchPol.ScheduleRunTimes.Clear()

$Dt = Get-Date

$SchPol.ScheduleRunTimes.Add($Dt.ToUniversalTime())

$RetPol = Get-AzRecoveryServicesBackupRetentionPolicyObject -WorkloadType "AzureVM" 

$RetPol.DailySchedule.DurationCountInDays = 365

New-AzRecoveryServicesBackupProtectionPolicy -Name "NewPolicy" -WorkloadType AzureVM -RetentionPolicy $RetPol -SchedulePolicy $SchPol
