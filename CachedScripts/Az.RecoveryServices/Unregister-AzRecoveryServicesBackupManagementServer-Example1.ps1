
$BMS = Get-AzRecoveryServicesBackupManagementServer -Name "dpmserver01.contoso.com"

Unregister-AzRecoveryServicesBackupManagementServer -AzBackupManagementServer $BMS
