
$Pol= Get-AzRecoveryServicesBackupProtectionPolicy -Name "NewPolicy"

Remove-AzRecoveryServicesBackupProtectionPolicy -Policy $Pol
