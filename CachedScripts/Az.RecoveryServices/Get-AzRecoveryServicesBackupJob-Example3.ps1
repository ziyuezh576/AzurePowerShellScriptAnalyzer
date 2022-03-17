
$vault = Get-AzRecoveryServicesVault -ResourceGroupName "resourceGroup" -Name "vaultName"

$Jobs = Get-AzRecoveryServicesBackupJob -Status InProgress -VaultId $vault.ID

$Job = $Jobs[0]

    Write-Host -Object "Waiting for completion..."

    Start-Sleep -Seconds 10

    $Job = Get-AzRecoveryServicesBackupJob -Job $Job -VaultId $vault.ID

Write-Host -Object "Done!"
