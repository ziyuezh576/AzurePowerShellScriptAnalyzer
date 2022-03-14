
$Pol = Get-AzRecoveryServicesBackupProtectionPolicy -Name "DefaultPolicy"

$inclusionDiskLUNS = ("1", "2")

Enable-AzRecoveryServicesBackupProtection -Policy $Pol -Name "V2VM" -ResourceGroupName "RGName1" -InclusionDisksList $inclusionDiskLUNS
