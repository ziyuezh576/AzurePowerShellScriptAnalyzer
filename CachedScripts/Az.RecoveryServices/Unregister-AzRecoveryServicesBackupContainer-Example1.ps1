
$Cont = Get-AzRecoveryServicesBackupContainer -ContainerType "Windows" -BackupManagementType MAB -Name "server01.contoso.com"

Unregister-AzRecoveryServicesBackupContainer -Container $Cont
