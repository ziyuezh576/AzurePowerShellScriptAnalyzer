
$StartDate = (Get-Date).AddDays(-7) 

$EndDate = Get-Date 

$Container = Get-AzRecoveryServicesBackupContainer -ContainerType AzureWorkload -Status Registered

$RP = Get-AzRecoveryServicesBackupItem -Container $Container -WorkloadType MSSQL | Get-AzRecoveryServicesBackupRecoveryLogChain -StartDate $Startdate.ToUniversalTime() -EndDate $Enddate.ToUniversalTime()
