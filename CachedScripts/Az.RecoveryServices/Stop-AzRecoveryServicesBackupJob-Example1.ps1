
$Job = Get-AzRecoveryServicesBackupJob -Operation Backup

Stop-AzRecoveryServicesBackupJob -JobID $Job.InstanceId
