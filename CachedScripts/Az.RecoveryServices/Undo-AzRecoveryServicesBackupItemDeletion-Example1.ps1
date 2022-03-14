
$Cont = Get-AzRecoveryServicesBackupContainer -ContainerType AzureVM

$PI = Get-AzRecoveryServicesBackupItem -Container $Cont[0] -WorkloadType AzureVM 

Disable-AzRecoveryServicesBackupProtection -Item $PI[0] -RemoveRecoveryPoints

$PI = Get-AzRecoveryServicesBackupItem -Container $Cont[0] -WorkloadType AzureVM | Where-Object {$_.DeleteState -eq "ToBeDeleted"}

Undo-AzRecoveryServicesBackupItemDeletion -Item $PI[0]
