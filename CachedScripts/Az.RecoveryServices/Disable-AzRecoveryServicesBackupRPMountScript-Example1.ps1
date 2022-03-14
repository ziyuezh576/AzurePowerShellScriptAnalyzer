
$namedContainer = Get-AzRecoveryServicesBackupContainer  -ContainerType "AzureVM" -Status "Registered" -FriendlyName "V2VM"

$backupitem = Get-AzRecoveryServicesBackupItem -Container $namedContainer  -WorkloadType "AzureVM"

$startDate = (Get-Date).AddDays(-7)

$endDate = Get-Date

$rp = Get-AzRecoveryServicesBackupRecoveryPoint -Item $backupitem -StartDate $startdate.ToUniversalTime() -EndDate $enddate.ToUniversalTime()

Get-AzRecoveryServicesBackupRPMountScript -RecoveryPoint $rp[0]

Disable-AzRecoveryServicesBackupRPMountScript -RecoveryPoint $rp[0]
