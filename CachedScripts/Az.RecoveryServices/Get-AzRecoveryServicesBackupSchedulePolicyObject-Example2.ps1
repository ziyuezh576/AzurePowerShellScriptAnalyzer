
$SchPol = Get-AzRecoveryServicesBackupSchedulePolicyObject -WorkloadType "AzureVM" 

$SchPol.ScheduleRunTimes.RemoveAll()

$DT = Get-Date

$SchPol.ScheduleRunTimes.Add($DT.ToUniversalTime())

New-AzRecoveryServicesBackupProtectionPolicy -Name "NewPolicy" -WorkloadType AzureVM -RetentionPolicy $RetPol -SchedulePolicy $SchPol
