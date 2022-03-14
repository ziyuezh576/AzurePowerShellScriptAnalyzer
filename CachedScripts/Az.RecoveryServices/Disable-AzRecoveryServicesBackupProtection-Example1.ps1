
$Cont = Get-AzRecoveryServicesBackupContainer -ContainerType AzureVM -Status Registered 

$PI = Get-AzRecoveryServicesBackupItem -Container $Cont[0] -WorkloadType AzureVM 

Disable-AzRecoveryServicesBackupProtection -Item $PI[0]
