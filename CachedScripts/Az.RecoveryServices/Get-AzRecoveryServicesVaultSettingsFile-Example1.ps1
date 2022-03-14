
$Vault01 = Get-AzRecoveryServicesVault -Name "TestVault"

$CredsPath = "C:\Downloads"

$Credsfilename = Get-AzRecoveryServicesVaultSettingsFile -Backup -Vault $Vault01 -Path $CredsPath
