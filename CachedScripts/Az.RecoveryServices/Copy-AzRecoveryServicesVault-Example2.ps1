
$sourceVault = Get-AzRecoveryServicesVault -ResourceGroupName "rgName1" -Name "vault1"

$targetVault = Get-AzRecoveryServicesVault -ResourceGroupName "rgName2" -Name "vault2"

Copy-AzRecoveryServicesVault -SourceVault $sourceVault -TargetVault $targetVault -RetryOnlyFailed
