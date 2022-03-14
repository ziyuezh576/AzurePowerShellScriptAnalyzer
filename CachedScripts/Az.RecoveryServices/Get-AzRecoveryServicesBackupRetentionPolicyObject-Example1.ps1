
$RetPol = Get-AzRecoveryServicesBackupRetentionPolicyObject -WorkloadType AzureVM 

$RetPol.DailySchedule.DurationCountInDays = 365

$SchPol = Get-AzRecoveryServicesBackupSchedulePolicyObject -WorkloadType AzureVM 

New-AzRecoveryServicesBackupProtectionPolicy -Name "NewPolicy" -WorkloadType AzureVM -RetentionPolicy $RetPol -SchedulePolicy $SchPol
