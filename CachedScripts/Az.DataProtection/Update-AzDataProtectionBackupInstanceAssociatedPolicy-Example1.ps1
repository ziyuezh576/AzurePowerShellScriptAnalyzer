
$sub = "xxxx-xxxx-xxxx"

$instance = Get-AzDataProtectionBackupInstance -SubscriptionId $sub -ResourceGroupName sarath-rg -VaultName sarath-vault

$policy = Get-AzDataProtectionBackupPolicy -SubscriptionId $sub -ResourceGroupName sarath-rg -VaultName sarath-vault

Update-AzDataProtectionBackupInstanceAssociatedPolicy -SubscriptionId $sub -ResourceGroupName sarath-rg -VaultName sarath-vault -BackupInstanceName $instance[0].Name -PolicyId $policy[1].Id
